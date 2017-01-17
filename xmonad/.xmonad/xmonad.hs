import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.Gaps
import XMonad.Layout.Fullscreen
import XMonad.Layout.BinarySpacePartition
import qualified Data.Map as M
import XMonad.Hooks.ManageDocks
import XMonad.Actions.UpdatePointer
--import XMonad.Actions.Navigation2D
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import XMonad.Actions.FloatKeys
import System.IO

myManageHook = composeAll
        [ className =? "Xmessage" --> doFloat
        , className =? "virt-manager" --> doFloat
	, manageDocks
	]

myLogHook = dynamicLog 
	>> updatePointer (0.99,0.99) (0,0)

myLayout = avoidStruts ( spacing 5 (gaps [(U,100), (D,100), (L,200), (R,200)] (ResizableTall 1 (2/100) (1/2) [])) ||| ResizableTall 1 (2/100) (1/2) []) ||| noBorders (fullscreenFull Full)
main = xmonad $ myConfig 

myConfig = def
    { borderWidth = 5
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
                               , myFloatKeys
                --	       , myNav2DKeys
		--	       , myBSPKeys ]
	                       ]
    
myCommandKeys = [ ("M-a", sendMessage MirrorShrink)
	 , ("M-z", sendMessage MirrorExpand)
	 ]

myProgKeys = [
               ("M-d", spawn myLauncher)
             , ("M-b", spawn myBrowser)
             , ("M-p", spawn myTerminal)
              ]

myFloatKeys = [
    ("M-C-j", withFocused (keysMoveWindow (0,10)))
  , ("M-C-k", withFocused (keysMoveWindow (0,-10)))
  , ("M-C-h", withFocused (keysMoveWindow (-10,0)))
  , ("M-C-l", withFocused (keysMoveWindow (10,0)))
  , ("M-M1-j", withFocused (keysResizeWindow (0,-10) (1,1)))
  , ("M-M1-k", withFocused (keysResizeWindow (0,10) (1,1)))
  , ("M-M1-h", withFocused (keysResizeWindow (10,0) (1,1)))
  , ("M-M1-l", withFocused (keysResizeWindow (-10,0) (1,1)))

              ]

myLauncher = "rofilauncher"
myTerminal = "st"
myBrowser = "surf"
myWorkspaces = ["1:brws", "2:dev", "3:virt", "4", "5", "6", "7", "8", "9"] 

myFocusedColour = "#ff7a7a"
myNormalColour = "#110000"
