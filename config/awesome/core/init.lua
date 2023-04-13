require 'core.util'
require 'core.conf'
require 'core.error_handle'


-- beautiful.init(('%s/theme/%s/theme.lua'):format(util.conf_dir, conf.theme))
beautiful.init(util.conf_dir .. '/theme/theme.lua')

awful.layout.layouts = conf.layout

local key = require 'core.mappings'
root.buttons(key.mouse)
-- Set keys
root.keys(key.global)
require 'core.rules'

require 'core.titlebar'
require 'core.signals'
require 'core.widget'
