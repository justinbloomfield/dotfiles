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
import System.IO

myManageHook = composeAll
        [ className =? "Xmessage" --> doFloat
	, className =? "virt-manager" --> doFloat
	, manageDocks
	]

myLogHook = dynamicLog 
	>> updatePointer (0.99,0.99) (0,0)

myLayout = avoidStruts ( spacing 10 (gaps [(U,15), (D,20), (L,20), (R,20)] (ResizableTall 1 (2/100) (1/2) [])) ||| ResizableTall 1 (2/100) (1/2) []) ||| noBorders (fullscreenFull Full)
main = xmonad $ myConfig 

myConfig = defaultConfig
    { borderWidth = 5
    , modMask = mod4Mask -- winkey for true swag
    , workspaces = ["1:brws", "2:dev", "3:virt", "4", "5", "6", "7", "8", "9"]
    , terminal = "urxvt"
    , focusedBorderColor = "#118566" --"#5f9d81"
    , normalBorderColor = "#3c3c3b" 
    , manageHook = myManageHook <+> manageHook defaultConfig
    , layoutHook = myLayout 
    , logHook = myLogHook <+> logHook defaultConfig
    } `additionalKeysP` concat [ myCommandKeys
                --	       , myNav2DKeys
		--	       , myBSPKeys ]
		]
    
myCommandKeys = [ ("M-d", spawn "thinglaunch") 
	 , ("M-a", sendMessage MirrorShrink)
	 , ("M-z", sendMessage MirrorExpand)
	 ]
-- for BSP (can't currently navigate properly??)
--myNav2DConfig = def { layoutNavigation = [("emptyBSP", centerNavigation)] }
--myNav2DKeys = [   ("M-h", windowGo L True)
--		, ("M-l", windowGo R True)
--		, ("M-j", windowGo D True)
--		, ("M-k", windowGo U True)
--		, ("M-S-h", windowSwap L True)
--		, ("M-S-l", windowSwap R True)
--		, ("M-S-j", windowSwap D True)
--		, ("M-S-k", windowSwap U True)
--	      ]
--myBSPKeys = [ ("M-M1-h", sendMessage $ ExpandTowards L)
--	    , ("M-M1-l", sendMessage $ ExpandTowards R)
--	    , ("M-M1-j", sendMessage $ ExpandTowards D)
--	    , ("M-M1-k", sendMessage $ ExpandTowards U)
--	    , ("M-C-h", sendMessage $ ShrinkFrom L) 
--	    , ("M-C-l", sendMessage $ ShrinkFrom R)
--	    , ("M-C-j", sendMessage $ ShrinkFrom D)
--	    , ("M-C-k", sendMessage $ ShrinkFrom U)
--	    , ("M-s", sendMessage $ Swap)
--	    , ("M-r", sendMessage $ Rotate)  
--	    ]
