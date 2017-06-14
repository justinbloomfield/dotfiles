import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Decoration
import XMonad.Layout.ResizableTile
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps
import XMonad.Layout.Groups.Wmii
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.Scratchpad
import Graphics.X11.ExtraTypes.XF86
import Data.Default
import Data.Monoid
import System.IO

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal :: [Char]
myBorderWidth :: Dimension
myNormalBorderColor :: [Char]
myFocusedBorderColor :: [Char]
myXmobarHlColor :: [Char]
myXmobarTitleColor :: [Char]
myFocusFollowsMouse :: Bool
myModMask :: KeyMask
myTerminal = "urxvtc"
myBorderWidth = 2
myNormalBorderColor = "#111d3c"
myFocusedBorderColor = "#208ae2"
myXmobarHlColor = "#227799"
myXmobarUrgentColor = "#10adee"
myXmobarTitleColor = "#ffffff"
myBackgroundColor = "#227799"
myFocusFollowsMouse = True
myModMask = mod4Mask

manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)
  where
    h = 0.3
    w = 0.5
    t = 1 - h
    l = (1 - w) * 0.5

myManageHook :: ManageHook
myManageHook =
  manageDocks <+>
  manageScratchPad

myLogHook :: Handle -> X ()
myLogHook xmproc =
  dynamicLogWithPP xmobarPP {
    ppCurrent = xmobarColor myXmobarHlColor ""
  , ppUrgent = xmobarColor myXmobarUrgentColor ""
  , ppHidden = xmobarColor myXmobarTitleColor "" . (\ws -> if ws == "NSP" then "" else ws)
  , ppOutput = hPutStrLn xmproc
  , ppSep = xmobarColor myXmobarHlColor "" " ∴ ", ppTitle = xmobarColor myXmobarTitleColor "".shorten 50
  }

myStartupHook :: X ()
myStartupHook = do
  spawn "xset -dpms"
  spawn "xset s off"
  spawn "export GTK_IM_MODULE=ibus"
  spawn "export XMODIFIERS=@im=ibus"
  spawn "export QT_IM_MODULE=ibus"
  spawn "ibus-daemon -drx"
  spawn "xcape -t 200 -e 'Shift_L=parenleft;Shift_R=parenright"
  spawn "xsetroot -solid '#0055aa'"

myLayout =
  noBorders (fullscreenFull Full) ||| avoidStruts (gaps [(U,20)] tiled)
  where
    tiled = ResizableTall nmaster delta ratio slaves
    nmaster = 1
    ratio = 1/2
    delta = 3/100
    slaves = []

myHandleEventHook :: Event -> X All
myHandleEventHook =
  handleEventHook def

scratchpad :: X ()
scratchpad = scratchpadSpawnActionTerminal "urxvtc"
newKeys XConfig {XMonad.modMask = modMask} =
  [ ((modMask, xK_u), scratchpad)
  , ((modMask, xK_a), sendMessage MirrorExpand)
  , ((modMask, xK_z), sendMessage MirrorShrink)
  , ((modMask, xK_p), spawn "rofilauncher")
  , ((modMask, xK_e), spawn "emacs")
  , ((modMask, xK_q), recompile True >> restart "xmonad" True)
  , ((modMask, xK_i), sendMessage (IncMasterN 1))
  , ((modMask, xK_d), sendMessage (IncMasterN (-1)))
  , ((modMask, xK_t), windows W.focusDown)
  , ((modMask, xK_n), windows W.focusUp)
  , ((modMask .|. shiftMask, xK_t), withFocused $ windows . W.sink)
  -- ((modMask .|. shiftMask, xK_t), W.swapDown )
  -- ((modMask .|. shiftMask, xK_c), W.swapUp )
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer sset Master 1%+ unmute")
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer sset Master 1%- unmute")
  , ((0, xF86XK_AudioMute), spawn "amixer sset Master toggle")
  , ((0, xF86XK_AudioPlay), spawn "mpc toggle")
  , ((0, xF86XK_AudioNext), spawn "mpc next")
  , ((0, xF86XK_AudioPrev), spawn "mpc prev")
  , ((controlMask, xK_Print), spawn "scrot $HOME/usr/img/scrot/%Y-%m-%d-%H:%M:%S.png")
  --, ((modMask, xK_End), spawn "scrot -s &")
  , ((modMask, xK_End), spawn "ssvr")
  ]
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys x = M.union (M.fromList (newKeys x)) (keys def x)

main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar /home/poq/.xmonad/xmobar.conf"
  xmonad $ ewmh def
    { borderWidth = myBorderWidth
    , terminal = myTerminal
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , focusFollowsMouse = myFocusFollowsMouse
    , manageHook = myManageHook
    , layoutHook = myLayout
    , logHook = myLogHook xmproc
    , handleEventHook = myHandleEventHook
    , startupHook = myStartupHook
    , modMask = myModMask
    , keys = myKeys
    }

