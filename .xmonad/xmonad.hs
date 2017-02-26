import XMonad

main = xmonad $ def
   { borderWidth        = 1
   , normalBorderColor  = "#333333"
   , focusedBorderColor = "#999999"
   , terminal           = "urxvt" }
