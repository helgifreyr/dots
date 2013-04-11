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
import XMonad.Layout.OneBig
import XMonad.Layout.Grid
import XMonad.Layout.LimitWindows
import XMonad.Layout.FixedColumn
import XMonad.Layout.Spacing  
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Gaps

import Data.Ratio
import XMonad.Layout.LayoutHints
import XMonad.Actions.UpdatePointer
import XMonad.Actions.CopyWindow
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.FloatNext


import System.IO
 
--myManageHook = composeAll
--    [ isFullscreen --> doFullFloat
--    ]

myManageHook = composeAll
    [ title     =? "shoot"  --> doFloat
    , className =? "Steam"  --> doCenterFloat
    , className =? "mplayer2"  --> doCenterFloat
    , className =? "feh"  --> doFloat
    , className =? "Gnuplot"  --> doFloat
    , manageDocks
    ]

myLayoutHook             =  avoidStruts $ smartBorders $ layout
  where layout           = code ||| grid ||| tiled ||| full
        full             = named "full" $ Full
        grid             = named "grid" $ Grid
--        big              = named "big" $ OneBig (3/4) (3/4)
--        mbig             = named "mbig" $ Mirror big
        tiled            = named "tiled" $ Tall 1 (3/100) (1/2)
--        mtiled           = named "mtiled" $ Mirror tiled
        code             = named "code" $ limitWindows 2 $ magnifiercz' 2.67 $ smartBorders $ Tall 1 (3/100) (3/4)


main = do
    xmproc <- spawnPipe "xmobar"  -- start xmobar
--    xmproc <- spawnPipe "xmobar /home/helgi/.xmobarrc2"  -- start xmobar
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = myLayoutHook
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppOrder               = \(ws:l:t:_)   -> [ws]
                        , ppTitle               = xmobarColor   "#5f349d" "" . shorten 50
                        , ppCurrent             = xmobarColor   "#5f349d" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
	      , normalBorderColor  = "#25143e"
	      , focusedBorderColor = "#5f349d"
    	  , terminal = "urxvt"
        } `additionalKeys`
        [ ((0, xK_F10), spawn "amixer set Master 10%- &gt; /dev/null")
        , ((0, xK_F11), spawn "amixer set Master 10%+ &gt; /dev/null")
        , ((0, xK_F9), spawn "amixer set Master 0% &gt; /dev/null")
        , ((0, xK_F12), spawn "amixer set Master 100% &gt; /dev/null")
        , ((0, xK_Print), spawn "urxvt -name shoot -geometry 30x2+700+550 -e shoot")
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
