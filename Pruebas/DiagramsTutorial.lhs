> {-# LANGUAGE NoMonomorphismRestriction #-}
> {-# LANGUAGE FlexibleContexts #-}
> {-# LANGUAGE TypeFamilies #-}

> import Diagrams.Prelude
> import Diagrams.Backend.SVG.CmdLine

> myCircle :: Diagram B
> myCircle = circle 1

> example :: Diagram B
> example = circle 1 # fc blue
>                    # lw veryThick
>                    # lc purple
>                    # dashingG [0.2, 0.5] 0

> example2 :: Diagram B
> example2 = atop (square 2000 # fc white)
>                 (circle 3000 # fc black
>                              # lc green
>                              # dashingG [0.2, 0.5] 0)

> example3 :: Diagram B
> example3 = atop (circle 3000 # fc black
>                              # lc green
>                              # dashingG [0.2, 0.5] 0)
>                 (square 2000 # fc white)

> example4 :: Diagram B
> example4 = square 2000 === circle 1000

> example5 :: Diagram B
> example5 = beside (r2 (1000, 0)) (circle 1000) (square 2000 # showOrigin)

> main = mainWith (example5 # showOrigin)
