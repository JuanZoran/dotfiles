local wz = require 'wezterm'
local act = wz.action

local M = {}

---utility for setting keymap
---@param mapping {[1]:string, [2]:string|table, [3]:any}
---@return any
local k = function(mapping)
    mapping.mods = mapping[1]
    mapping.action = mapping[3]
    mapping[1] = nil
    mapping[3] = nil

    local key = mapping[2]
    mapping[2] = nil

    if type(key) == 'string' then
        mapping.key = key
        return mapping
    elseif type(key == 'table') then
        mapping.__index = mapping
        local clone = function(tbl)
            return setmetatable({}, tbl)
        end

        local mappings = {}
        for i, v in ipairs(key) do
            local k = clone(mapping)
            k.key = v
            mappings[i] = k
        end
        return table.unpack(mappings)
    else
        error 'Invalid mapping'
    end
end

M.leader = k { 'CTRL', 'a', timeout_milliseconds = 1000 }

local mod = 'CTRL|SHIFT'
local lead = 'LEADER'


M.keys = {
    k { mod, 'x', act.ActivateCopyMode },
    k { lead, 'o', act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    k { lead, 'u', act.SplitPane { direction = 'Down' } },

    -- INFO : Pane Navigation
    k { lead, 'i', act.ActivatePaneDirection 'Up' },
    k { lead, 'k', act.ActivatePaneDirection 'Down' },
    k { lead, 'j', act.ActivatePaneDirection 'Left' },
    k { lead, 'l', act.ActivatePaneDirection 'Right' },

    -- k { lead, 'n', act. "Right" },

    -- INFO : Pane Select (Swap)
    k { lead, ' ', act.PaneSelect { alphabet = 'ijkluohasdwe' } },
    k { lead, 's', act.PaneSelect { alphabet = 'ijkluohasdwe', mode = 'SwapWithActive' } },


    -- INFO : Scroll
    k { lead, 'g', act.ScrollToTop },
    k { lead, 'G', act.ScrollToBottom },
    k { mod, 'i', act.ScrollByPage(-0.5) },
    k { mod, 'k', act.ScrollByPage(0.5) },

    k { lead, 'r', act.ReloadConfiguration },
    k { mod, ' ', act.QuickSelect },
    -- INFO : Pane Adjust Size
    -- k { mod, 'i', act.AdjustPaneSize { "Up", 5 } },
    -- k { mod, 'k', act.AdjustPaneSize { "Down", 5 } },
    -- k { mod, 'j', act.AdjustPaneSize { "Left", 5 } },
    -- k { mod, 'l', act.AdjustPaneSize { "Right", 5 } },

    k { mod, 'UpArrow', act.AdjustPaneSize { 'Up', 5 } },
    k { mod, 'DownArrow', act.AdjustPaneSize { 'Down', 5 } },
    k { mod, 'LeftArrow', act.AdjustPaneSize { 'Left', 5 } },
    k { mod, 'RightArrow', act.AdjustPaneSize { 'Right', 5 } },

    -- INFO : Tab Navigation
    k { mod, 'j', act.ActivateTabRelative(-1) },
    k { mod, 'l', act.ActivateTabRelative(1) },


    -- NOTE :Tab Move
    k { mod, '[', act.MoveTabRelative(-1) },
    k { mod, ']', act.MoveTabRelative(1) },


    -- INFO :Tab New
    k { mod, 'o', act.SpawnTab 'CurrentPaneDomain' },

    k { 'LEADER|CTRL', 'a', act.SendString '\x01' },
    -- k { 'CTRL', 'i', act.SendString '\x1b[105;5u' },


    -- NOTE :Close
    k { lead, 'd', act.CloseCurrentPane { confirm = false } },
    k { mod, 'q', act.CloseCurrentTab { confirm = false } },

    k { mod, 'c', act.CopyTo 'Clipboard' },
    k { mod, 'v', act.PasteFrom 'Clipboard' },

    k { 'CTRL', '-', act.DecreaseFontSize },
    k { 'CTRL', '=', act.IncreaseFontSize },
}

---@format disable-next
local CopyMode = act.CopyMode
M.key_tables = {
    copy_mode = {
        { key = 'y',          action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },
        { key = 'Escape',     action = CopyMode 'Close' },
        { key = 'q',          action = CopyMode 'Close' },
        { key = 'i',          action = CopyMode 'MoveUp' },
        { key = 'k',          action = CopyMode 'MoveDown' },
        { key = 'j',          action = CopyMode 'MoveLeft' },
        { key = 'l',          action = CopyMode 'MoveRight' },
        { key = 'UpArrow',    action = CopyMode 'MoveUp' },
        { key = 'DownArrow',  action = CopyMode 'MoveDown' },
        { key = 'LeftArrow',  action = CopyMode 'MoveLeft' },
        { key = 'RightArrow', action = CopyMode 'MoveRight' },


        -- { key = 'I',     action = act.CopyMode 'PageUp' },
        -- { key = 'K',   action = act.CopyMode 'PageDown' },
        { key = 'I',          action = CopyMode { MoveByPage = (-0.5) } },
        { key = 'K',          action = CopyMode { MoveByPage = (0.5) } },
        { key = 'J',          action = CopyMode 'MoveToStartOfLine' },
        { key = 'L',          action = CopyMode 'MoveToEndOfLineContent' },
        { key = 'w',          action = CopyMode 'MoveForwardWord' },
        { key = 'e',          action = CopyMode 'MoveForwardWordEnd' },
        { key = 'b',          action = CopyMode 'MoveBackwardWord' },
        { key = ',',          action = CopyMode 'JumpReverse' },
        { key = ';',          action = CopyMode 'JumpAgain' },
        { key = 'f',          action = CopyMode { JumpForward = { prev_char = false } } },
        { key = 'F',          action = CopyMode { JumpBackward = { prev_char = false } } },
        { key = 't',          action = CopyMode { JumpForward = { prev_char = true } } },
        { key = 'T',          action = CopyMode { JumpBackward = { prev_char = true } } },
        { key = 'Space',      action = CopyMode { SetSelectionMode = 'Cell' } },
        { key = 'v',          action = CopyMode { SetSelectionMode = 'Cell' } },
        { key = 'V',          action = CopyMode { SetSelectionMode = 'Line' } },
        {
            mods = 'CTRL',
            key = 'v',
            action = act.CopyMode { SetSelectionMode = 'Block' },
        },
        { key = 'o',     action = CopyMode 'MoveToSelectionOtherEnd' },
        { key = 'O',     action = CopyMode 'MoveToSelectionOtherEndHoriz' },
        { key = 'g',     action = CopyMode 'MoveToScrollbackTop' },
        { key = 'G',     action = CopyMode 'MoveToScrollbackBottom' },
        { mods = 'CTRL', key = 'g',                                       action = CopyMode 'Close' },
        -- { key = 'Enter',      action = act.CopyMode 'MoveToStartOfNextLine' },
        -- { mods = 'ALT',   key = 'LeftArrow',  action = act.CopyMode 'MoveBackwardWord' },
        -- { mods = 'ALT',   key = 'RightArrow', action = act.CopyMode 'MoveForwardWord' },
    },
}


return M
