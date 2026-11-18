import {
    compact,
    CONFIG_DIR_NAME,
    type ExtensionAPI,
    type ExtensionContext,
} from "@earendil-works/pi-coding-agent";
import { readFileSync } from "node:fs";
import { join } from "node:path";
import { homedir } from "node:os";

type Model = NonNullable<ReturnType<ExtensionContext["modelRegistry"]["find"]>>;

export default function (pi: ExtensionAPI) {
    function getConfiguredCompactionModel(cwd: string): string | undefined {
        for (const path of [
            join(cwd, CONFIG_DIR_NAME, "settings.json"),
            join(homedir(), ".pi", "agent", "settings.json"),
        ]) {
            try {
                const value = JSON.parse(readFileSync(path, "utf8")).compaction_model;
                if (typeof value === "string" && value.trim().length > 0) {
                    return value.trim();
                }
            } catch {
                // ignore missing or malformed settings files
            }
        }
        return undefined;
    }

    function resolveModel(ctx: ExtensionContext, configured: string): Model | undefined {
        if (configured.includes("/")) {
            const [provider, id] = configured.split("/", 2);
            if (provider && id) {
                const found = ctx.modelRegistry.find(provider, id);
                if (found) return found;
            }
        }
        const found = ctx.modelRegistry.getAll().find((m) => m.id === configured);
        return found;
    }

    pi.on("session_before_compact", async (event, ctx) => {
        const configured = getConfiguredCompactionModel(ctx.cwd);
        if (!configured) return;

        const target = resolveModel(ctx, configured);
        if (!target) {
            console.warn(`[Compaction] configured compaction model not found: ${configured}`);
            return { cancel: true };
        }

        try {
            const auth = await ctx.modelRegistry.getApiKeyAndHeaders(target);
            if (!auth.ok) {
                console.warn(`[Compaction] authentication failed for ${target.provider}/${target.id}: ${auth.error}`);
                return { cancel: true };
            }

            console.log(`[Compaction] compacting with: ${target.provider}/${target.id}`);
            const result = await compact(
                event.preparation,
                target,
                auth.apiKey,
                auth.headers,
                event.customInstructions,
                event.signal,
                "off",
                undefined,
                auth.env,
            );

            return { compaction: result };
        } catch (err) {
            console.warn(
                `[Compaction] failed with ${target.provider}/${target.id}: ${err instanceof Error ? err.message : String(err)}`,
            );
            return { cancel: true };
        }
    });
}
