import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.Fullscreen
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.IndependentScreens
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageDocks
import XMonad.Actions.UpdatePointer
import XMonad.Actions.Navigation2D
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Actions.FloatKeys
import Graphics.X11.ExtraTypes.XF86
import System.Environment
import System.IO

myManageHook = composeAll
        [ className =? "Xmessage" --> doFloat
        , className =? "virt-manager" --> doFloat
	, className =? "Steam" --> doFloat
	, manageDocks
	]

myLogHook = dynamicLog 
	>> updatePointer (0.99,0.99) (0,0)


myLayout = avoidStruts $ spacing 5  (gaps [(U,10), (D,10), (L,10), (R,10)] (Tall nmaster delta ratio)) ||| noBorders (fullscreenFull Full)
	where
	nmaster = 1
	ratio = 1/2
	delta = 2/100
	 

main = do
	unsetEnv "GHC_PACKAGE_PATH"
	getEnv "PREVPATH" >>= setEnv "PATH"
	unsetEnv "PREVPATH"
	xmonad $ myConfig 

myConfig = def
    { borderWidth = 3
    , modMask = mod4Mask -- winkey for true swag
    , workspaces = myWorkspaces
    , terminal = myTerminal
    , focusedBorderColor = myFocusedColour
    , normalBorderColor = myNormalColour
    , manageHook = myManageHook <+> manageHook def
    , layoutHook = myLayout 
    , logHook = myLogHook <+> logHook def
    } `additionalKeysP` concat [ myCommandKeys
                               , myProgKeys
	               	       , myNav2DKeys
                               , myMediaKeys
	                       ]
--      `additionalKeys` concat [ myISKeys]
    
myCommandKeys = [ ("M-a", sendMessage MirrorShrink)
	 , ("M-z", sendMessage MirrorExpand)
	 , ("M-i", sendMessage (IncMasterN 1))
	 , ("M-d", sendMessage (IncMasterN (-1)))
	 ]

myProgKeys = [
               ("M-p", spawn myLauncher)
             , ("M-b", spawn myBrowser)
             , ("M-c t", spawn myTime)
              ]



myNav2DKeys = [
              ("M-,", screenGo R True)
            , ("M-.", screenGo L True)
            , ("M-M1-,", screenSwap R False)
            , ("M-M1-.", screenSwap L False)
            ]

myMediaKeys = [
  ("<XF86AudioLowerVolume>", spawn "amixer sset Master 1%+ unmute"),
  ("<XF86AudioRaiseVolume>", spawn "amixer sset Master 1%- unmute"),
  ("<XF86AudioMute>", spawn "amixer sset Master toggle")
              ]

myLauncher = "rofilauncher"
myTerminal = "urxvt"
myBrowser = "firefox"
myWorkspaces = withScreens 2 ["1:brws", "2:dev", "3:virt", "4", "5", "6", "7", "8", "9"] 
myTime = "xmessage $(date)"

myFocusedColour = "#03c03c"
myNormalColour = "#002211"

--myFloatKeys = [
--    ("M-C-j", withFocused (keysMoveWindow (0,10)))
--  , ("M-C-k", withFocused (keysMoveWindow (0,-10)))
--  , ("M-C-h", withFocused (keysMoveWindow (-10,0)))
--  , ("M-C-l", withFocused (keysMoveWindow (10,0)))
--  , ("M-M1-j", withFocused (keysResizeWindow (0,-10) (1,1)))
--  , ("M-M1-k", withFocused (keysResizeWindow (0,10) (1,1)))
--  , ("M-M1-h", withFocused (keysResizeWindow (10,0) (1,1)))
--  , ("M-M1-l", withFocused (keysResizeWindow (-10,0) (1,1)))
--              ]
--
--myBSPKeys = [
--              ("M-M1-s", sendMessage $ Swap)
--            , ("M-M1-r", sendMessage $ Rotate)
--            , ("M-M1-h", sendMessage $ ExpandTowards L)
--            , ("M-M1-l", sendMessage $ ShrinkFrom L)
--            , ("M-M1-j", sendMessage $ ShrinkFrom U)
--            , ("M-M1-k", sendMessage $ ExpandTowards U)
--            , ("M-C-h", sendMessage $ ShrinkFrom R)
--            , ("M-C-l", sendMessage $ ExpandTowards R)
--            , ("M-C-k", sendMessage $ ShrinkFrom D)
--            , ("M-C-j", sendMessage $ ExpandTowards D)]
-- Nav2D shit
--              ("M-C-p", switchLayer)
--            -- Directional navigation
--            , ("M-h", windowGo L True)
--            , ("M-j", windowGo D True)
--            , ("M-k", windowGo U True)
--            , ("M-l", windowGo R True)
--            -- Swapping windows
--            , ("M-H", windowSwap L True)
--            , ("M-J", windowSwap D True)
--            , ("M-K", windowSwap U True)
--            , ("M-L", windowSwap R True)
--            -- Directional screen navigation
