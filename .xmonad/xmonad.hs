import XMonad
import XMonad.Layout.NoBorders

mylayoutHook = smartBorders tiled ||| smartBorders (Mirror tiled) ||| noBorders Full
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

main = xmonad $ def
   { borderWidth        = 8
   , normalBorderColor  = "#d6f7de"
   , focusedBorderColor = "#f442b3"
   , layoutHook = mylayoutHook
   , terminal           = "urxvt" }
