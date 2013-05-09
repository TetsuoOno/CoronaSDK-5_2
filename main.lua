-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
--storyboardAPIの呼出し
local storyboard = require "storyboard"

--同じフォルダ内のscene1.luaへ遷移
storyboard.gotoScene( "scene1", "fade", 1000)

--[[
fade
zoomOutIn
zoomOutInFade
zoomInOut
zoomInOutFade
flip
flipFadeOutIn
zoomOutInRotate
zoomOutInFadeRotate
zoomInOutRotate
zoomInOutFadeRotate
fromRight (over original scene)
fromLeft (over original scene)
fromTop (over original scene)
fromBottom (over original scene)
slideLeft (pushes original scene)
slideRight (pushes original scene)
slideDown (pushes original scene)
slideUp (pushes original scene)
crossFade
]]--

--TabBarのような、画面遷移しても表示し続ける共通パーツがある場合、ここに記述します。