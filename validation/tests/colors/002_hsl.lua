-- =============================================================
-- Copyright Roaming Gamer, LLC. 2008-2016 (All Rights Reserved)
-- =============================================================

-- =============================================================
-- Localizations
-- =============================================================
-- Lua
local getTimer = system.getTimer; local mRand = math.random
local mAbs = math.abs
local strMatch = string.match; local strGSub = string.gsub; local strSub = string.sub
--
-- Common SSK Display Object Builders
local newCircle = ssk.display.newCircle;local newRect = ssk.display.newRect
local newImageRect = ssk.display.newImageRect;local newSprite = ssk.display.newSprite
local quickLayers = ssk.display.quickLayers
--
-- Common SSK Helper Modules
local easyIFC = ssk.easyIFC;local persist = ssk.persist
--
-- Common SSK Helper Functions
local isValid = display.isValid;local isInBounds = ssk.easyIFC.isInBounds
local normRot = math.normRot;local easyAlert = ssk.misc.easyAlert
--
-- SSK 2D Math Library
local addVec = ssk.math2d.add;local subVec = ssk.math2d.sub;local diffVec = ssk.math2d.diff
local lenVec = ssk.math2d.length;local len2Vec = ssk.math2d.length2;
local normVec = ssk.math2d.normalize;local vector2Angle = ssk.math2d.vector2Angle
local angle2Vector = ssk.math2d.angle2Vector;local scaleVec = ssk.math2d.scale
ssk.misc.countLocals(1)

-- =============================================================
-- =============================================================

-- PLUGIN REQUIRES GO HERE

-- =============================================================
local test = {}

function test.run( group, params )
   group = group or display.currentStage
   params = params or {}

   local startX = left + 100
   local startY = top + 100

   local curX = startX
   local curY = startY

	-- RGB 2 HSL & HSL 2 RGB
	curX = startX
	local c = ssk.colors.rgb2hsl(_R_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_G_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_B_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_O_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_Y_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_P_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_PURPLE_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_GREY_)
	local c2 = ssk.colors.hsl2rgb( c )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	-- hueOffset
	curX = startX
	curY = curY + 100
	local c = ssk.colors.rgb2hsl(_R_)
	local c1 = ssk.colors.hueOffset(c, 60 )
	local c2 = ssk.colors.hsl2rgb( c1 )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )

	curX = curX + 80
	local c = ssk.colors.rgb2hsl(_R_)
	local c1 = ssk.colors.hueOffset(c, -60 )
	local c2 = ssk.colors.hsl2rgb( c1 )
	newRect( group, curX, curY, { size = 80, fill = c2  } )

	-- hslNeighbors
	curX = startX
	curY = curY + 100
	local c = ssk.colors.rgb2hsl(_R_)
	local c2,c3 = ssk.colors.hslNeighbors( c, 90 )
	c2 = ssk.colors.hsl2rgb( c2 )
	c3 = ssk.colors.hsl2rgb( c3 )	
	newRect( group, curX, curY, { size = 80, fill = c2  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = c3  } )

	-- hslTriadic
	curX = curX + 100
	local c = ssk.colors.rgb2hsl(_R_)
	local c2,c3 = ssk.colors.hslTriadic( c )
	c2 = ssk.colors.hsl2rgb( c2 )
	c3 = ssk.colors.hsl2rgb( c3 )	
	newRect( group, curX, curY, { size = 80, fill = c2  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = c3  } )

	-- hslSplitComplementary
	curX = curX + 100
	local c = ssk.colors.rgb2hsl(_R_)
	local c2,c3 = ssk.colors.hslSplitComplementary( c, 30 )
	c2 = ssk.colors.hsl2rgb( c2 )
	c3 = ssk.colors.hsl2rgb( c3 )	
	newRect( group, curX, curY, { size = 80, fill = c2  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = c3  } )

	-- rgbOffset
	curX = startX
	curY = curY + 100
	local c1 = ssk.colors.rgbOffset( _R_, 60 )
	newRect( group, curX, curY, { size = 80, fill = c1  } )

	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )

	curX = curX + 80
	local c1 = ssk.colors.rgbOffset( _R_, -60 )
	newRect( group, curX, curY, { size = 80, fill = c1  } )

	-- hslNeighbors
	curX = startX
	curY = curY + 100
	local c2,c3 = ssk.colors.rgbNeighbors( _R_, 90 )
	newRect( group, curX, curY, { size = 80, fill = c2  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = c3  } )

	-- rgbTriadic
	curX = curX + 100
	local c2,c3 = ssk.colors.rgbTriadic( _R_ )
	newRect( group, curX, curY, { size = 80, fill = c2  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = c3  } )

	-- rgbSplitComplementary
	curX = curX + 100
	local c2,c3 = ssk.colors.rgbSplitComplementary( _R_, 30 )
	newRect( group, curX, curY, { size = 80, fill = c2  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = _R_  } )
	curX = curX + 80
	newRect( group, curX, curY, { size = 80, fill = c3  } )
end


return test
