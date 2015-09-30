import Data.Default
import qualified Data.Map as M
import XMonad
import XMonad.Actions.UpdatePointer
import XMonad.Actions.TopicSpace
import XMonad.Config.Azerty
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Util.Paste

myTerminal = "urxvt -depth 32 -fg white -bg black -sr -bc"

myTopics = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myTopicConfig = TopicConfig
    { defaultTopicAction    = const $ spawnTerminal >*> 3
    , defaultTopic          = "term"
    , maxTopicHistory       = 10
    , topicDirs             = M.fromList $
        []
    , topicActions          = M.fromList $
        []
    }

dmenu = "GTK_IM_MODULE=xim QT_IM_MODULE=xin /home/vrobert/.dmenu_run"

myKeys conf@(XConfig {modMask = modm}) = M.fromList $
    [ ((modm, xK_p), spawn dmenu)
    ]

spawnTerminal   = spawn $ myTerminal

tall_1_2 = Tall 1 (1/100) (50/100)
tall_2_3 = Tall 1 (1/100) (65/100)

myLayoutHook =
    avoidStruts $
    (noBorders Full ||| tall_1_2 ||| Mirror tall_1_2 ||| Grid)

myLogHook = updatePointer Nearest

myConfig = do
    checkTopicConfig myTopics myTopicConfig
    return $ defaultConfig
        { workspaces            = myTopics
        , terminal              = myTerminal
        , normalBorderColor     = "#0000ff"
        , focusedBorderColor    = "#ff0000"
        , modMask               = mod4Mask
        , layoutHook            = myLayoutHook
        , logHook               = myLogHook
        , manageHook            = manageDocks
        , keys                  = \c -> myKeys c `M.union` keys defaultConfig c
        }

main = xmonad =<< myConfig
