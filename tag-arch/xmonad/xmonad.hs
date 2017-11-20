import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.NoBorders

-- makes it so when I only have one window open, I don't see a border
mylayoutHook = smartBorders tiled ||| smartBorders (Mirror tiled) ||| noBorders Full
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

main = xmonad =<< statusBar "xmobar" myXmobarPP toggleStrutsKey myConfig

myXmobarPP = def
  {
    ppCurrent = xmobarColor "#f442b3" "#333333"
    , ppHidden = xmobarColor "#ffe059" "#333333"
    , ppUrgent = xmobarColor "red" "#333333"
    , ppWsSep = " "
    , ppOrder = \(workspaces:_layout:title:_) -> [workspaces] -- set order, and exclude layout (idc) and title (hm I don't think I care)
  }

-- Keybinding to toggle the gap for the bar.
-- Note: no idea what this means
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- main config
myConfig = def {
  terminal = "urxvt"
    , layoutHook = mylayoutHook
    , borderWidth = 4
    , normalBorderColor  = "#d6f7de"
    , focusedBorderColor = "#f442b3"
}
