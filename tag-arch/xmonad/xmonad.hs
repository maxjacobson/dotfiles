import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops        (ewmh)
import XMonad.Hooks.ManageDocks
import System.Taffybar.Hooks.PagerHints (pagerHints)
import XMonad.Util.EZConfig (additionalKeysP)

-- makes it so when I only have one window open, I don't see a border
mylayoutHook = smartBorders tiled ||| smartBorders (Mirror tiled) ||| noBorders Full
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

baseConfig = desktopConfig

main = xmonad $
  -- gives taffybar logger information
  ewmh $
  pagerHints $
  baseConfig
    { terminal = "alacritty"
    , layoutHook = avoidStruts $ mylayoutHook
    , manageHook = manageDocks <+> manageHook baseConfig
    , borderWidth = 4
    , normalBorderColor  = "#d6f7de"
    , focusedBorderColor = "#f442b3"
    } `additionalKeysP`
      [
        ("M-p", spawn "rofi -show run")
      ]
