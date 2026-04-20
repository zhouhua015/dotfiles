local o = vim.opt
local util = require('my.util')
local augroup = util.augroup
local autocmd = util.autocmd
local project_root = vim.fs.dirname(vim.fs.find('.nvim.lua', {
    path = vim.fn.getcwd(),
    upward = true,
})[1])

local project_include_paths = {
    "include",
    "share/include",
    "share/guishared/include",
    "share/pabshared/include",
    "share/configshared/include",
    "core/analysis_plugins/alarmkit/include",
    "core/analysis_plugins/shared/include",
    "core/include",
    "core/engine/include",
    "core/engine/capture/napatech_driver/include",
    "core/engine/setupkit/include",
    "core/analyst_ngin/flowengine/include",
}
o.path:append(project_include_paths)

local service_targets = {
    cassini = true,
    dmngrd = true,
    pharma = true,
    nia = true,
    triss = true,
}

local function normalize_path(path)
    return vim.fs.normalize(path):gsub('\\', '/')
end

local function relative_to_project(path)
    local normalized_path = normalize_path(path)
    local normalized_root = normalize_path(project_root)

    if normalized_path == normalized_root then
        return ''
    end

    local prefix = normalized_root .. '/'
    if normalized_path:sub(1, #prefix) == prefix then
        return normalized_path:sub(#prefix + 1)
    end

    return normalized_path
end

local function read_cmake_target(cmake_path)
    local lines = vim.fn.readfile(cmake_path)

    for _, line in ipairs(lines) do
        local target = line:match('^%s*project%s*%(%s*([%w_%-]+)')
        if target then
            return target
        end
    end

    for _, line in ipairs(lines) do
        local target = line:match('^%s*add_[^%(]+%(%s*([%w_%-]+)')
        if target and target ~= '${PROJECT_NAME}' then
            return target
        end
    end
end

local function target_for_path(path)
    local rel_path = relative_to_project(path)
    local top_dir = rel_path:match('^([^/]+)')

    if top_dir and service_targets[top_dir] then
        return top_dir
    end

    local dir = vim.fs.dirname(path)
    local cmake = vim.fs.find('CMakeLists.txt', {
        path = dir,
        upward = true,
        stop = project_root,
    })[1]

    if cmake then
        local target = read_cmake_target(cmake)
        if target and target ~= 'tplatform2.0' then
            return target
        end
    end

    return 'core'
end

local function set_makeprg_for_buffer(bufnr)
    local path = vim.api.nvim_buf_get_name(bufnr)
    local target = target_for_path(path ~= '' and path or vim.fn.getcwd())
    vim.bo[bufnr].makeprg = './package/devcontainer.sh build --debug --target=' .. target
    return target
end

_G.tplatform_build_target_for_path = target_for_path
_G.tplatform_set_makeprg_for_buffer = set_makeprg_for_buffer

o.makeprg = './package/devcontainer.sh build --debug --target=core'
vim.keymap.set('n', '<C-Space>', function()
    local target = set_makeprg_for_buffer(0)
    vim.cmd.write()
    vim.cmd.make()
    vim.notify('Building ' .. target)
end, { silent = true })

augroup('set_myfiletypes', {
    autocmd('BufRead,BufNewFile', 'CMakePatch.txt', 'set filetype=cmake'),
    autocmd('BufRead,BufNewFile', 'Dockerfile-*', 'set filetype=dockerfile')
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost' }, {
    callback = function(args)
        if vim.api.nvim_buf_is_valid(args.buf) then
            tplatform_set_makeprg_for_buffer(args.buf)
        end
    end,
})

vim.lsp.config('clangd', {
    cmd = {
        'dev-container-clangd',
        '--path-mappings=' .. project_root .. '=/app/tplatform2.0',
    },
})

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            ".git/", "node_modules", "poetry.lock",
            "build/", "analyzer/", "analyst/gui", "analyst/thrift", "report/",
            "%.png", "%.gif", "%.ico", "%.pdf", "%.tar"
        },
    }
    -- pickers = {
    --     find_files = {
    --         find_command = { "fd", "--type", "f", "--exclude", "analyzer" }
    --     },
    --     live_grep = {
    --         find_command = { "rg", "--type", "f", "--exclude", "analyzer" }
    --     }
    -- }
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = vim.fn.getcwd() .. "/*",
    callback = function()
        local disabled_fts = { "c", "cpp", "python" }

        -- Check if current filetype is in our list
        if vim.tbl_contains(disabled_fts, vim.bo.filetype) then
            vim.b.disable_autoformat = true
        end
    end,
})

