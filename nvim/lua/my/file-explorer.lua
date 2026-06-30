require("nvim-tree").setup {
    view = {
        width = 45,
        signcolumn = "yes",
        cursorline = false
    },
    modified = {
        enable = true
    },
    actions = {
      open_file = {
        resize_window = false
      }
    },
    renderer = {
        indent_width = 3,
        icons = {
            show = {
                git = true,
                hidden = true
            },
            -- git_placement = "signcolumn",
            bookmarks_placement = "after",
            symlink_arrow = " -> ",
            glyphs = {
                -- folder = {
                --     arrow_closed = " ",
                --     arrow_open = " ",
                --     default = "",
                --     open = "",
                --     empty = "",
                --     empty_open = "",
                --     symlink = "",
                --     symlink_open = ""
                -- },
                -- default = "󱓻",
                -- symlink = "󱓻",
                bookmark = "",
                modified = "",
                hidden = "󱙝",
                git = {
                    unstaged = "×",
                    staged = "",
                    unmerged = "󰧾",
                    untracked = "",
                    renamed = "",
                    deleted = "",
                    ignored = "∅"
                }
            }
        }
    },
    filters = {
        git_ignored = false
    },
    hijack_cursor = true,
    sync_root_with_cwd = true
}

-- Quick toggle
vim.api.nvim_set_keymap('n', '<F9>', ':NvimTreeToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', ':NvimTreeFindFile<CR>', { silent = true })

-- A separate statusline for nvim-tree windows
local nt_api = require'nvim-tree.api'

nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function()
  local tree_winid = nt_api.tree.winid()

  if tree_winid ~= nil then
    -- vim.api.nvim_set_option_value('statusline', '%t', {win = tree_winid})
    vim.api.nvim_set_option_value('statusline', ' ', {win = tree_winid})
  end
end)

-- -- Open NvimTree on startup
-- local function open_nvim_tree(data)
--   -- Skip opening if Neovim was started in diff mode
--   if vim.api.nvim_buf_get_option(data.buf, "buftype") == "nofile" then
--     return
--   end
--
--   nt_api.tree.open()
-- end
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- -- Float Window Mode
--
-- -- setup with a config
--
-- local HEIGHT_RATIO = 0.8
-- local WIDTH_RATIO = 0.5
--
-- ---@type nvim_tree.config
-- local config = {
--     sort = {
--         sorter = "case_sensitive",
--     },
--     view = {
--         float = {
--             enable = true,
--             open_win_config = function()
--                 local screen_w = vim.opt.columns:get()
--                 local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
--                 local window_w = screen_w * WIDTH_RATIO
--                 local window_h = screen_h * HEIGHT_RATIO
--                 local window_w_int = math.floor(window_w)
--                 local window_h_int = math.floor(window_h)
--                 local center_x = (screen_w - window_w) / 2
--                 local center_y = ((vim.opt.lines:get() - window_h) / 2)
--                 - vim.opt.cmdheight:get()
--                 return {
--                     border = 'rounded',
--                     relative = 'editor',
--                     row = center_y,
--                     col = center_x,
--                     width = window_w_int,
--                     height = window_h_int,
--                 }
--             end,
--         },
--         width = function()
--             return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
--         end,
--     },
--     renderer = {
--         group_empty = true,
--     },
--     filters = {
--         dotfiles = true,
--     },
-- }
-- require("nvim-tree").setup(config)
-- -- Make sure the floating window resize properly
-- local api = require("nvim-tree.api")
--
-- vim.api.nvim_create_augroup("NvimTreeResize", {
--   clear = true,
-- })
--
-- vim.api.nvim_create_autocmd({ "VimResized", "WinResized" }, {
--   group = "NvimTreeResize",
--   callback = function()
--     -- Get the nvim-tree window ID
--     local winid = api.tree.winid()
--     if (winid) then
--       api.tree.reload()
--     end
--   end
-- })
