import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Prompt
import XMonad.Prompt.Ssh
import qualified Data.Map as M
import XMonad.Layout.Circle
import XMonad.Layout.Magnifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Named
import XMonad.Layout.Grid
import XMonad.Layout.LimitWindows
import XMonad.Layout.FixedColumn
import XMonad.Layout.Spacing  
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Gaps
import XMonad.Layout.PerWorkspace


import Data.Ratio
import XMonad.Layout.LayoutHints
import XMonad.Actions.UpdatePointer
import XMonad.Actions.CopyWindow
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FloatNext
import XMonad.Hooks.ManageHelpers


import System.IO
 
--myManageHook = composeAll
--    [ isFullscreen --> doFullFloat
--    ]

myManageHook = composeAll
    [ title     =? "shoot"  --> doFloat
    , className =? "Steam"  --> doCenterFloat
    , className =? "mplayer2"  --> doCenterFloat
    , className =? "mpv"  --> doCenterFloat
    , className =? "feh"  --> doFloat
    , className =? "GV"  --> doFloat
    , className =? "Gnuplot"  --> doFloat
    , className =? "Hangouts"  --> doFloat
    , title     =? "smallTerm" --> doFloat
    , title     =? "ncmpcpp" --> doFloat
    , manageDocks
    ]

-- myWorkspaces = ["code","web","latex","pdf","term","irssi","mathematica","storage"]

myLayoutHook             =  avoidStruts $ smartBorders
                            $ onWorkspace "2" ( full ||| tiled )
                            $ ( tiled ||| full ||| latex ||| grid ||| mgrid )
  where
        full             = named "full" $ Full
        grid             = named "grid" $ Grid
        mgrid             = named "mgrid" $ Mirror (Grid)
        tiled            = named "tall" $ Tall 1 (3/100) (1/2)
        -- code             = named "code" $ limitWindows 2 $ magnifiercz' 2.67 $ smartBorders $ Tall 1 (3/100) (3/4)
        latex            = named "latex" $ limitWindows 3 $ magnifiercz' 1.4 $ FixedColumn 1 20 100 10

main = do
    xmproc <- spawnPipe "xmobar"  -- start xmobar
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = myLayoutHook
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppOrder               = \(ws:l:t:_)   -> [ws,l]
                        , ppTitle               = xmobarColor   "#5f349d" "" . shorten 50
                        , ppCurrent             = xmobarColor   "#5f349d" "" . shorten 50
                        , ppLayout              = xmobarColor   "#5f349d" "" . shorten 50
                        , ppSep                 = "<fc=#71637d> | </fc>"
                        }
        -- , workspaces = myWorkspaces
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
	      , normalBorderColor  = "#25143e"
	      , focusedBorderColor = "#5f349d"
    	  , terminal = "urxvt"
        } `additionalKeys`
        [ ((0, xK_Print), spawn "urxvt -name shoot -geometry 28x1+700+550 -e shoot")
        , ((mod4Mask, xK_m), spawn "urxvt -name smallTerm -geometry 50x8+700+450")
        , ((mod4Mask, xK_n), spawn "urxvt -name ncmpcpp -geometry 80x20+600+450 -e ncmpcpp")
        , ((mod4Mask, xK_F4), spawn "dmenu-mpd -a")
        , ((mod4Mask, xK_F3), spawn "dmenu-mpd -l")
        , ((mod4Mask, xK_F2), spawn "dmenu-mpd -j")
        , ((mod4Mask, xK_F1), spawn "dmenu-mpd -t")
        , ((mod4Mask, xK_F9), spawn "mpc play")
        , ((mod4Mask, xK_F12), spawn "mpc pause")
        , ((mod4Mask, xK_F11), spawn "mpc next")
        , ((mod4Mask, xK_F10), spawn "mpc prev")
        , ((mod4Mask, xK_p), spawn "dmenu_run")
        , ((mod4Mask, xK_b), sendMessage ToggleStruts )
        ]
