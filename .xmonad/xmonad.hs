import XMonad
import XMonad.Util.EZConfig(additionalKeys)

--import XMonad hiding ( (|||) )
--import XMonad.Core
--import XMonad.Util.Run
--import XMonad.Util.Loggers
--import XMonad.Layout.LayoutCombinators
--import XMonad.Hooks.DynamicLog
--import XMonad.Hooks.ManageDocks

--myXmonadBar = "dzen2 -p -xs 1"
--
--myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full) ||| Full
--  where
--     -- default tiling algorithm partitions the screen into two panes
--     tiled   = Tall nmaster delta ratio
-- 
--     -- The default number of windows in the master pane
--     nmaster = 1
-- 
--     -- Default proportion of screen occupied by master pane
--     ratio   = 1/2
-- 
--     -- Percent of screen to increment by when resizing panes
--     delta   = 3/100
--
--myLogHook h = dynamicLogWithPP $ defaultPP
--
--    -- display current workspace as darkgrey on light grey (opposite of 
--    -- default colors)
--    { ppCurrent         = dzenColor "#303030" "#909090" . pad 
--
--    -- display other workspaces which contain windows as a brighter grey
--    , ppHidden          = dzenColor "#909090" "" . pad 
--
--    -- display other workspaces with no windows as a normal grey
--    , ppHiddenNoWindows = dzenColor "#606060" "" . pad 
--
--    -- display the current layout as a brighter grey
--    , ppLayout          = dzenColor "#909090" "" . pad 
--
--    -- if a window on a hidden workspace needs my attention, color it so
--    , ppUrgent          = dzenColor "#ff0000" "" . pad . dzenStrip
--
--    -- shorten if it goes over 100 characters
--    , ppTitle           = shorten 100
--
--    -- no separator between workspaces
--    , ppWsSep           = ""
--
--    -- put a few spaces between each object
--    , ppSep             = "  "
--
--    -- output to the handle we were given as an argument
--    , ppOutput          = hPutStrLn h
--
--    -- add the date and time
--    , ppExtras          = [padL $ date "%b %d %R"]
--    }


main = do
--    dzenBar <- spawnPipe myXmonadBar
    xmonad $ defaultConfig
        { modMask = mod4Mask
        , terminal = "xterm -e tmux"
        , focusFollowsMouse = False
--        , layoutHook = myLayout
--        , logHook = myLogHook dzenBar
        } `additionalKeys`
        [ ((mod4Mask, xK_x), spawn "xterm") ]
