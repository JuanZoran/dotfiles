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

    k { mod, 'r', act.ReloadConfiguration },
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
M.key_tables = {
    copy_mode = {
        { key = 'Escape',     action = act.CopyMode 'Close' },
        { key = 'q',          action = act.CopyMode 'Close' },
        { key = 'y',          action = act.Multiple { { CopyTo = 'ClipboardAndPrimarySelection' }, { CopyMode = 'Close' } } },


        { key = 'i',          action = act.CopyMode 'MoveUp' },
        { key = 'k',          action = act.CopyMode 'MoveDown' },
        { key = 'j',          action = act.CopyMode 'MoveLeft' },
        { key = 'l',          action = act.CopyMode 'MoveRight' },
        { key = 'UpArrow',    action = act.CopyMode 'MoveUp' },
        { key = 'DownArrow',  action = act.CopyMode 'MoveDown' },
        { key = 'LeftArrow',  action = act.CopyMode 'MoveLeft' },
        { key = 'RightArrow', action = act.CopyMode 'MoveRight' },


        -- { key = 'I',     action = act.CopyMode 'PageUp' },
        -- { key = 'K',   action = act.CopyMode 'PageDown' },
        { key = 'I', action = act.CopyMode { MoveByPage = (-0.5) } },
        { key = 'K', action = act.CopyMode { MoveByPage = (0.5) } },
        { key = 'J',       action = act.CopyMode 'MoveToStartOfLine' },
        { key = 'L',          action = act.CopyMode 'MoveToEndOfLineContent' },


        { key = 'w',          action = act.CopyMode 'MoveForwardWord' },
        { key = 'e',          action = act.CopyMode 'MoveForwardWordEnd' },
        { key = 'b',          action = act.CopyMode 'MoveBackwardWord' },
        { key = ',',          action = act.CopyMode 'JumpReverse' },
        { key = ';',          action = act.CopyMode 'JumpAgain' },

        { key = 'f',          action = act.CopyMode { JumpForward = { prev_char = false } } },
        { key = 'F',          action = act.CopyMode { JumpBackward = { prev_char = false } } },
        { key = 't',          action = act.CopyMode { JumpForward = { prev_char = true } } },
        { key = 'T',          action = act.CopyMode { JumpBackward = { prev_char = true } } },

        { key = 'Space',      action = act.CopyMode { SetSelectionMode = 'Cell' } },
        { key = 'v',          action = act.CopyMode { SetSelectionMode = 'Cell' } },
        { key = 'V',          action = act.CopyMode { SetSelectionMode = 'Line' } },
        { mods = 'CTRL',      key = 'v', action = act.CopyMode { SetSelectionMode = 'Block' } },

        { key = 'o',          action = act.CopyMode 'MoveToSelectionOtherEnd' },
        { key = 'O',          action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },

        { key = 'g',          action = act.CopyMode 'MoveToScrollbackTop' },
        { key = 'G',          action = act.CopyMode 'MoveToScrollbackBottom' },


        { mods = 'CTRL',      key = 'g', action = act.CopyMode 'Close' },
        -- { key = 'Enter',      action = act.CopyMode 'MoveToStartOfNextLine' },
        -- { mods = 'ALT',   key = 'LeftArrow',  action = act.CopyMode 'MoveBackwardWord' },
        -- { mods = 'ALT',   key = 'RightArrow', action = act.CopyMode 'MoveForwardWord' },
    },
}


return M
