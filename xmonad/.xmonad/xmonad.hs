import XMonad
import XMonad.Actions.CycleWS
import XMonad.Actions.TagWindows
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.Decoration
import XMonad.Layout.Fullscreen
import XMonad.Layout.Gaps
import XMonad.Layout.IndependentScreens
import XMonad.Layout.NoBorders
import XMonad.Layout.PerScreen
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Prompt
import XMonad.Util.Run(spawnPipe)
-- import XMonad.Util.Scratchpad
import Graphics.X11.ExtraTypes.XF86
import Data.Default
import Data.Monoid
import Data.Ratio
import System.IO
import System.Environment

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
myTerminal = "myterm"
myBorderWidth = 3
myNormalBorderColor = "#95aec7"
myFocusedBorderColor = "#c795ae"
myXmobarHlColor = "#AC8AC1"
myXmobarUrgentColor = "#6F8BBD"
myXmobarTitleColor = "#34444D"
myBackgroundColor = "#AC8AC1"
myFocusFollowsMouse = True
myModMask = mod4Mask

myManageHook :: ManageHook
myManageHook =
  manageDocks <+>
  composeAll [
    className =? "Gimp"     --> doFloat
  , className =? "Xmessage" --> doFloat
             ]

myLogHook xmproc =
  dynamicLogWithPP xmobarPP {
    ppCurrent = xmobarColor myXmobarHlColor "#FFFFFF"
  , ppUrgent = xmobarColor myXmobarUrgentColor "#EEEEEE"
  , ppHidden = xmobarColor myXmobarTitleColor "#3E2DFE" . (\ws -> if ws == "NSP" then "" else ws)
  , ppOutput = hPutStrLn xmproc
  , ppSep = xmobarColor myXmobarHlColor "" " / ", ppTitle = xmobarColor myXmobarTitleColor "".shorten 50
  }

myStartupHook :: X ()
myStartupHook = do
  spawn "xset s off"
  spawn "export GTK_IM_MODULE=ibus"
  spawn "export XMODIFIERS=@im=ibus"
  spawn "export QT_IM_MODULE=ibus"
--  spawn "export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket"
--  spawn "export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket"
  spawn "xcape -t 300 -e 'Shift_L=parenleft;Shift_R=parenright'"
  spawn "xsetroot -cursor_name left_ptr"
  spawn "dbus-launch"
  --  setWMName "Openbox"

myLayout =
  noBorders (fullscreenFull Full) ||| avoidStruts emptyBSP
  where
    tiled = ResizableTall nmaster delta ratio slaves
    nmaster = 1
    ratio = 1/2
    delta = 3/100
    slaves = []

myHandleEventHook :: Event -> X All
myHandleEventHook =
  docksEventHook 

-- scratchpad :: X ()
-- scratchpad = scratchpadSpawnActionTerminal "st"
newKeys conf@(XConfig {XMonad.modMask = modMask}) =
--  [ ((modMask, xK_u), scratchpad)
--  , ((modMask, xK_a), sendMessage MirrorExpand)
--  , ((modMask, xK_z), sendMessage MirrorShrink)
  [ ((modMask, xK_exclam), spawn "rofilauncher")
  , ((modMask, xK_j), swapNextScreen)
  , ((modMask, xK_k), shiftNextScreen)
  , ((modMask, xK_b), spawn "surf")
  , ((modMask, xK_c), spawn myTerminal)
  , ((modMask, xK_q), spawn "xmonad --recompile && xmonad --restart")
  , ((modMask, xK_x), kill )
  , ((modMask, xK_t), windows W.focusDown)
  , ((modMask, xK_n), windows W.focusUp)
  , ((modMask, xK_l), spawn "slock")
  , ((modMask .|. shiftMask, xK_f), withFocused $ windows . W.sink)

  -- BSP Keys
  , ((modMask, xK_r), sendMessage Swap)
  , ((modMask, xK_o), sendMessage  FocusParent)
  , ((modMask .|. shiftMask, xK_r), sendMessage Rotate)
  , ((modMask .|. shiftMask, xK_o), sendMessage MoveNode)
  , ((modMask .|. shiftMask, xK_s), sendMessage $ ExpandTowards R)
  , ((modMask .|. shiftMask, xK_h), sendMessage $ ExpandTowards L)
  , ((modMask .|. shiftMask, xK_n), sendMessage $ ExpandTowards U)
  , ((modMask .|. shiftMask, xK_t), sendMessage $ ExpandTowards D)
  , ((modMask .|. controlMask, xK_s), sendMessage $ ShrinkFrom R)
  , ((modMask .|. controlMask, xK_h), sendMessage $ ShrinkFrom L)
  , ((modMask .|. controlMask, xK_n), sendMessage $ ShrinkFrom U)
  , ((modMask .|. controlMask, xK_t), sendMessage $ ShrinkFrom D)
  , ((modMask .|. controlMask, xK_o), sendMessage SelectNode)

  -- Audio
  , ((0, xF86XK_AudioRaiseVolume), spawn "amixer sset Master 1%+ unmute")
  , ((0, xF86XK_AudioLowerVolume), spawn "amixer sset Master 1%- unmute")
  , ((0, xF86XK_AudioMute), spawn "amixer sset Master toggle")
  , ((0, xF86XK_AudioPlay), spawn "mpc toggle")
  , ((0, xF86XK_MonBrightnessUp), spawn "light -A 10")
  , ((0, xF86XK_MonBrightnessDown), spawn "light -U 10")
  , ((0, xF86XK_AudioNext), spawn "mpc next")
  , ((0, xF86XK_AudioPrev), spawn "mpc prev")
  , ((controlMask, xK_Print), spawn "scrot $HOME/usr/img/scrot/%Y-%m-%d-%H:%M:%S.png")
  ]
  ++
  [((m .|. modMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_v, xK_z] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
  ++
  [((m .|. modMask, k), windows $ onCurrentScreen f i) 
      | (i, k) <- zip (workspaces' conf) [xK_semicolon, xK_comma, xK_period, xK_p]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

  
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys x = M.union (M.fromList (newKeys x)) (keys def x)

main :: IO ()
main = do
--  unsetEnv "GHC_PACKAGE_PATH"
--  getEnv "PREVPATH" >>= setEnv "PATH"
--  unsetEnv "PREVPATH"
  xmobar  <- spawnPipe "xmobar /home/poq/.xmonadrc"
--  xmobar2 <- spawnPipe "xmobar /home/poq/.xmonad/xmobar2.conf"
  xmonad $ ewmh def
    { borderWidth = myBorderWidth
    , terminal = myTerminal
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , focusFollowsMouse = myFocusFollowsMouse
    , manageHook = myManageHook
    , layoutHook = myLayout
    , logHook = myLogHook xmobar
    , handleEventHook = myHandleEventHook
    , startupHook = myStartupHook
    , modMask = myModMask
    , workspaces = withScreens 2 ["a", "b", "c", "d"]
    , keys = myKeys
    }

