
local oo            = require("loop.simple")

local AppletMeta    = require("jive.AppletMeta")
local jul           = require("jive.utils.log")

local appletManager = appletManager
local jiveMain      = jiveMain


module(...)
oo.class(_M, AppletMeta)


function jiveVersion(meta)
	return 1, 1
end


function defaultSettings(meta)
	return { 
		brightness	= 32,
		dimmedTimeout	= 10000,	-- 10 seconds
		sleepTimeout	= 60000,	-- 60 seconds
		suspendTimeout 	= 3600000,	-- 1 hour
		suspendEnabled  = true,
		suspendWake     = nil,
		dimmedAC	= false,
		wlanPSEnabled   = true,
	}
end


function registerApplet(meta)
	jul.addCategory("squeezeboxJive", jul.DEBUG)

	-- Fixup settings after upgrade
	local settings = meta:getSettings()
	if not settings.suspendTimeout then
		settings.suspendTimeout	= 3600000 -- 1 hour
	end

	-- SqueezeboxJive is a resident Applet
	appletManager:loadApplet("SqueezeboxJive")

	jiveMain:addItem(meta:menuItem('backlightSetting', 'screenSettings', "BSP_BACKLIGHT_TIMER", function(applet, ...) applet:settingsBacklightTimerShow(...) end))
	jiveMain:addItem(meta:menuItem('brightnessSetting', 'screenSettings', "BSP_BRIGHTNESS", function(applet, ...) applet:settingsBrightnessShow(...) end))
	jiveMain:addItem(meta:menuItem('powerDown', 'advancedSettings', "POWER_DOWN", function(applet, ...) applet:settingsPowerDown(...) end))
	jiveMain:addItem(meta:menuItem('suspendTest', 'factoryTest', "POWER_MANAGEMENT_SETTINGS", function(applet, ...) applet:settingsTestSuspend(...) end, _, { noCustom = 1 }))
end


--[[

=head1 LICENSE

Copyright 2007 Logitech. All Rights Reserved.

This file is subject to the Logitech Public Source License Version 1.0. Please see the LICENCE file for details.

=cut
--]]

