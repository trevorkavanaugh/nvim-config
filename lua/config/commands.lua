-- lua/config/commands.lua (or in keymaps.lua)

-- Pick your close command: 'Bdelete' or 'Bwipeout'
local close_cmd = "Bdelete"

-- Buffers where we should NOT hijack :q / :wq
local excluded_fts = {
    help = true,
    qf = true,
    ["neo-tree"] = true,
    aerial = true,
    lazy = true,
    TelescopePrompt = true,
    alpha = true,
    dashboard = true,
    trouble = true,
}

local last_screen_to_show = "dashboard"

local function show_dashboard()
    pcall(vim.cmd, "AerialClose")
    -- pcall(vim.cmd, 'Neotree close')
    pcall(vim.cmd, "Dashboard")
    vim.defer_fn(function()
        vim.o.showtabline = 2
    end, 60)
end

-- listed real-file buffers (what :ls shows, filtered to buftype=='')
local function listed_real_file_bufnrs()
    local bufs = {}
    for _, info in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        if vim.bo[info.bufnr].buftype == "" then
            bufs[#bufs + 1] = { bufnr = info.bufnr, lastused = info.lastused or 0 }
        end
    end
    return bufs
end

local function most_recent_real_file_buf()
    local bufs = listed_real_file_bufnrs()
    table.sort(bufs, function(a, b)
        return a.lastused > b.lastused
    end)
    return bufs[1] and bufs[1].bufnr or nil
end

local function find_real_file_window_in_tab()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local b = vim.api.nvim_win_get_buf(win)
        if vim.bo[b].buftype == "" and vim.fn.buflisted(b) == 1 then
            return win, b
        end
    end
    return nil, nil
end

local function count_listed_file_bufs()
    local n = 0
    for _, info in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
        local b = info.bufnr
        if vim.bo[b].buftype == "" then
            n = n + 1
        end
    end
    return n
end

-- SmartQuit: close current file; if it’s the last, show Dashboard (or :qa if already on dashboard)
vim.api.nvim_create_user_command("SmartQuit", function(opts)
    local bang = opts.bang and "!" or ""
    local force = (bang ~= "") -- force-close if user typed :q!

    -- If on a special buffer, jump to a real file first (window → MRU).
    if vim.bo.buftype ~= "" then
        local win, buf = find_real_file_window_in_tab()
        if win and buf then
            vim.api.nvim_set_current_win(win)
        else
            local target = most_recent_real_file_buf()
            if target then
                vim.api.nvim_set_current_buf(target)
            else
                -- no real files open at all
                return show_dashboard()
            end
        end
    end

    -- Prompt on modified files (unless forcing).
    if vim.bo.modified and not force then
        local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
        local choice = vim.fn.confirm(
            ("Save changes to %s?"):format(name ~= "" and name or "[No Name]"),
            "&Save\n&Quit without Saving\n&Cancel",
            1
        )
        if choice == 1 then
            vim.cmd("write")
        elseif choice == 2 then
            force = true -- close without saving
        else
            return -- Cancel
        end
    end

    -- Decide: close current file, or show dashboard if it's the last one.
    if count_listed_file_bufs() > 1 then
        vim.cmd(close_cmd .. (force and "!" or "")) -- Bdelete/Bwipeout (respect !)
    else
        if vim.bo.filetype == last_screen_to_show then
            vim.cmd("qa" .. (force and "!" or ""))
        else
            vim.cmd(close_cmd .. (force and "!" or ""))
            show_dashboard()
        end
    end
end, { bang = true })

vim.api.nvim_create_user_command("SmartWrite", function(opts)
    local bang = opts.bang and "!" or ""

    if vim.bo.buftype ~= "" then
        -- If there are any real files (:ls would show at least one), write one of them
        local win, buf = find_real_file_window_in_tab()
        if win and buf then
            vim.api.nvim_set_current_win(win)
            return vim.cmd("w" .. bang)
        end
        local target = most_recent_real_file_buf()
        if target then
            vim.api.nvim_set_current_buf(target)
            return vim.cmd("w" .. bang)
        end

        -- No real files at all → nothing to write; just leave the special window
        return vim.cmd("q" .. bang)
    end

    -- Current buffer is a real file
    if vim.bo.filetype == last_screen_to_show then
        return
    else
        vim.cmd("w" .. bang)
    end
end, { bang = true })

-- SmartWq: write via SmartWrite, then reuse SmartQuit logic
vim.api.nvim_create_user_command("SmartWq", function(opts)
    local bang = opts.bang and "!" or ""
    vim.cmd("SmartWrite" .. bang)
    vim.cmd("SmartQuit" .. bang)
end, { bang = true })

-- Replace the <CR> dispatcher with a Lua one (no Vimscript ternaries)
_G.CmdlineDispatch = function()
    if vim.fn.getcmdtype() ~= ":" then
        return "<CR>"
    end
    local cl = vim.fn.getcmdline():gsub("%s+$", "")
    local bang = (cl:find("!%s*$") and "!") or ""

    if cl:match("^%s*[qQ]!*$") then
        return "<C-u>SmartQuit" .. bang .. "<CR>"
    elseif cl:match("^%s*[wW][qQ]!*$") then
        return "<C-u>SmartWq" .. bang .. "<CR>"
    elseif cl:match("^%s*[wW]%s*!*$") or cl:match("^%s*[Ww][Rr][Ii][Tt][Ee]%s*!*$") then
        return "<C-u>SmartWrite" .. bang .. "<CR>"
    else
        return "<CR>"
    end
end

vim.keymap.set("c", "<CR>", function()
    return _G.CmdlineDispatch()
end, { expr = true, silent = true })
