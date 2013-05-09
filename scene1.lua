----------------------------------------------------------------------------------
--
-- scene1.lua
--
----------------------------------------------------------------------------------
--storyboardAPIの呼出し
local storyboard = require( "storyboard" )

--新しいscene（このscene1.luaファイル）の作成
local scene = storyboard.newScene()
----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
--ここからcreateSceneまでの間にscene1で使用する、変数・オブジェクト・functionを宣言
local _W = display.contentWidth
local _H = display.contentHeight
local text1

local function onTouch( event )
	if("began" == event.phase )then
		text1.text = "touch"
		text1.x = _W/2 ; text1.y = _H/2
	elseif("ended" == event.phase )then
		storyboard.removeAll()
		storyboard.gotoScene( "scene2" )
	end
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	--ここに画面内のオブジェクトを作成します。
	--グループに追加します。
	text1 = display.newText( "", 0, 0, nil, 40 )
	group:insert(text1)
	-----------------------------------------------------------------------------
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	--function onTouchの呼出し
	Runtime:addEventListener( "touch", onTouch )
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	--functionの破棄
	Runtime:removeEventListener( "touch", onTouch )
	-----------------------------------------------------------------------------
	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene