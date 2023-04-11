require 'core.error_handle'

require 'core.conf'
require 'core.util'

require 'core.widget'


beautiful.init(util.conf_dir .. '/theme/theme.lua') -- Themes define colours, icons, font and wallpapers.
local key = require 'core.mappings'
root.buttons(key.mouse)
-- Set keys
root.keys(key.global)

awful.layout.layouts = conf.layout

require 'core.rules'
require 'core.signal'

require 'core.titlebar'
