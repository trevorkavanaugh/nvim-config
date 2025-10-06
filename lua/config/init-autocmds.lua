-- Early autocmds (must exist before plugins)

-- Basics
local aug = vim.api.nvim_create_augroup("UserBasics", { clear = true })
local keep = vim.api.nvim_create_augroup("KeepTabline", { clear = true })
local ignore_ft = {
    dashboard = true,
    alpha = true,
    ["neo-tree"] = true,
    aerial = true,
    lazy = true,
    help = true,
    qf = true,
    Trouble = true,
}

vim.api.nvim_create_autocmd("TextYankPost", {
    group = aug,
    callback = function()
        vim.highlight.on_yank({ timeout = 120 })
    end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
    group = aug,
    command = "checktime",
})

-- Startup sidebars
vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.schedule(function()
            local main = vim.api.nvim_get_current_win()
            -- open Neo-tree as you already do
            pcall(vim.cmd, "Neotree filesystem reveal left")
            -- expand everything under the current root
            -- neo_tree_expand_all()
            -- reopen Aerial, refocus main window, etc. (your existing lines)
            -- pcall(vim.cmd, "AerialOpen right")
            -- restore focus to the main window (your stored win id)
            pcall(vim.api.nvim_set_current_win, main)
        end)
    end,
})

local function aerial_is_open_in_tab()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local b = vim.api.nvim_win_get_buf(win)
        if vim.bo[b].filetype == "aerial" then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufReadPost", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("AerialAutoOpen", { clear = true }),
    callback = function(args)
        local main = vim.api.nvim_get_current_win()
        if vim.bo[args.buf].buftype ~= "" then
            return
        end -- only real files
        if ignore_ft[vim.bo[args.buf].filetype] then
            return
        end -- skip specials
        if aerial_is_open_in_tab() then
            return
        end -- already open
        pcall(function()
            require("aerial").open({ direction = "right" })
        end)
        pcall(vim.api.nvim_set_current_win, main)
    end,
})

-- Re-enable after Dashboard shows (and on its buffer enter)
vim.api.nvim_create_autocmd({ "User", "BufEnter", "BufWinEnter", "TabEnter" }, {
    group = keep,
    pattern = { "DashboardReady", "dashboard" },
    callback = function()
        vim.defer_fn(function()
            vim.o.showtabline = 2
        end, 60)
    end,
})

-- If anything flips the option, flip it back
vim.api.nvim_create_autocmd("OptionSet", {
    group = keep,
    pattern = "showtabline",
    callback = function()
        if vim.o.showtabline ~= 2 then
            vim.schedule(function()
                vim.o.showtabline = 2
            end)
        end
    end,
})
