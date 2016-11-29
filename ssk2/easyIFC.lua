-- =============================================================
-- Copyright Roaming Gamer, LLC. 2008-2016 (All Rights Reserved)
-- =============================================================
-- Easy Interfaces Loader
-- =============================================================
--   Last Updated: 23 NOV 2016
-- Last Validated: 23 NOV 2016
-- =============================================================

_G.ssk = _G.ssk or {}
local _rgEasyIFC = {}
_G.ssk.easyIFC = _rgEasyIFC

-- ==
--    table.shallowCopy( src [ , dst ]) - Copies single-level tables; handles non-integer indexes; does not copy metatable
-- ==
local function shallowCopy( src, dst )
	local dst = dst or {}
	if( not src ) then return dst end
	for k,v in pairs(src) do 
		dst[k] = v
	end
	return dst
end

shallowCopy( require( "ssk2.interfaces.buttons" ), _rgEasyIFC )
shallowCopy( require( "ssk2.interfaces.sbc" ), _rgEasyIFC )
shallowCopy( require( "ssk2.interfaces.effects" ), _rgEasyIFC )
shallowCopy( require( "ssk2.interfaces.labels" ), _rgEasyIFC ) 

require "ssk2.interfaces.presets.default.presets"

return _rgEasyIFC