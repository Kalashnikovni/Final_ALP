{-# LANGUAGE DataKinds #-}

module Eval where

-- Módulos propios
import Common

-- Módulos prestados
import Data.Ext 
import Data.List
import Data.Geometry.Point
import Data.Geometry.LineSegment

import qualified Algorithms.Geometry.LineSegmentIntersection.BentleyOttmann as BO (intersections) 

import Graphics.Gloss.Data.Vector 
import Graphics.Gloss.Geometry.Line

-- Definiciones de tipos datos --
---------------------------------

data Quadrant    = I | II | III | IV deriving (Eq, Show)

isCW CW  = True
isCW CCW = False

-- Funciones --
---------------

-- ** Definitions **

evalDefC :: Def -> Container
evalDefC (Dc c s) = c {p1x = s * p1x c,
                       p1y = s * p1y c,
                       p2x = s * p2x c,
                       p2y = s * p2y c}

evalDefP :: Def -> Polygon
evalDefP (Dp po s) = po {p = map (\(x,y) -> (x * s, y * s)) (p po)} 

-- ** Machine **

evalMac :: Machine -> (Containers, Polygons)
evalMac (Kerf k ds) = let (c, p) = (filter isContainer ds, filter isPolygon ds)
                      in (map evalDefC c, map (addKerf k areaSigned) (map evalDefP p))

isContainer :: Def -> Bool
isContainer (Dc _ _) = True
isContainer _          = False

isPolygon :: Def -> Bool
isPolygon (Dp _ _) = True
isPolygon _          = False

-- "Infla" el polígono para considerar el material que saca la máquina de corte
addKerf :: Float -> ([MyPoint] -> CCW) -> Polygon -> Polygon
addKerf o f po 
    | length l < 3 = po
    | otherwise    = (newPoints (l ++ [head l])) {pn = pn po}  
    where ppo = p po
          l   = linearize o (ppo ++ [head ppo]) (f ppo) 

-- Obtiene las rectas "offseteadas" correspondientes a cada segmento
linearize :: Float -> [MyPoint] -> CCW -> [(MyPoint, MyPoint)]
linearize o (w:(x:ys)) c = offsetLine o w x c : (linearize o (x:ys) c)    
linearize _ _ _          = []

newPoints :: [(MyPoint, MyPoint)] -> Polygon
newPoints []  = P {p = [], pn = ""}
newPoints [x] = P {p = [], pn = ""}
newPoints (x:(y:zs)) = case intersectLineLine (fst x) (snd x) (fst y) (snd y) of
                        Nothing -> po
                        Just pn -> po {p = pn : (p po)} 
    where po = newPoints (y:zs)

-- <0 es horario, >0 es anti horario 
areaSigned :: [MyPoint] -> CCW--Float
areaSigned points = if sum (zipWith (*) xdiffs ysums) < 0 then CW else CCW
    where xdiffs = zipWith (-) xs (tail xs ++ [head xs])
          ysums  = zipWith (+) ys (tail ys ++ [head ys])
          xs = map fst points
          ys = map snd points 

-- True es sentido horario, False es sentido antihorario
offsetLine :: Float -> MyPoint -> MyPoint -> CCW -> (MyPoint, MyPoint)
offsetLine o p1 p2 c 
    | q == I || q == IV = if isCW c  
                          then pp
                          else pm 
    | otherwise         = if isCW c
                          then pm
                          else pp
    where q     = whichQuadrant p1 p2
          alpha = if q == I || q == II
                  then angleVV (0,1) (fst p2 - fst p1, snd p2 - snd p1) 
                  else pi - angleVV (0,1) (fst p2 - fst p1, snd p2 - snd p1) 
          h     = o / (sin alpha)
          pp    = if isNaN h || isInfinite h
                  then ((fst p1 + o, snd p1), (fst p2 + o, snd p2)) 
                  else ((fst p1, snd p1 + h), (fst p2, snd p2 + h)) 
          pm    = if isNaN h || isInfinite h
                  then ((fst p1 - o, snd p1), (fst p2 - o, snd p2)) 
                  else ((fst p1, snd p1 - h), (fst p2, snd p2 - h)) 

whichQuadrant :: MyPoint -> MyPoint -> Eval.Quadrant
whichQuadrant p1 p2 
    | fst p1 < fst p2 && snd p1 <= snd p2 = I
    | fst p1 >= fst p2 && snd p1 < snd p2 = II
    | fst p1 > fst p2 && snd p1 >= snd p2 = III
    | otherwise                           = IV 

-- ** Archivos SVG **

evalRect :: Rect -> Container
evalRect r 
    | null (tr r) = C {p1x = 0,
                       p1y = 0,
                       p2x = w r,
                       p2y = h r,
                       nc  = nr r,
                       rid = -1}
    | otherwise   = evalRect (r {w = abs (x - x'), h = abs (y - y'), tr = tail (tr r)})
    where trh      = head (tr r)
          (x, y)   = applyT1 (0, 0) trh
          (x', y') = applyT1 (w r, h r) trh

-- Aplicación de las diversas transformaciones
applyT1 :: MyPoint -> Transform -> MyPoint
applyT1 p (Scale s)                  = applyT1 p (Matrix s 0 0 s 0 0) 
applyT1 p (SkewX s)                  = applyT1 p (Matrix 1 0 (tan (s * pi / 180)) 1 0 0)
applyT1 p (SkewY s)                  = applyT1 p (Matrix 1 (tan (s * pi / 180)) 0 1 0 0)
applyT1 p (Matrix m1 m2 m3 m4 m5 m6) = (fst p * m1 + snd p * m3 + m5, fst p * m2 + snd p * m4 + m6)
applyT1 p Thrash                     = p

evalSVGPol :: SVGPolygon -> Float -> Polygon
evalSVGPol pol k
    | null (tpo pol) = addKerf k areaSigned (P {p = po pol, pn = npo pol})
    | otherwise      = evalSVGPol (pol {po = map (\x -> applyT1 x (head (tpo pol))) (po pol), tpo = tail (tpo pol)}) k

evalPath :: Path -> Float -> Polygon
evalPath path k = evalSVGPol (Pol {po = evalPathC (pa path) (0,0) True, tpo = tpa path, npo = npa path}) k

-- El bool es True si el comando es absoluto, y False en caso contrario
evalPathC :: [PathCommand] -> MyPoint -> Bool -> [MyPoint]
evalPathC []             _ b     = []
evalPathC (M_rel p : ps) _ b     = p : (evalPathC ps p False)
evalPathC (M_abs p : ps) _ b     = p : (evalPathC ps p True)
evalPathC (H_rel f : ps) p' b    = let np = (fst p' + f, snd p')
                                   in np : (evalPathC ps np b) 
evalPathC (H_abs f : ps) p' b    = let np = (f, snd p')
                                   in np : (evalPathC ps np b) 
evalPathC (V_rel f : ps) p' b    = let np = (fst p', snd p' + f)
                                   in np : (evalPathC ps np b) 
evalPathC (V_abs f : ps) p' b    = let np = (fst p', f)
                                   in np : (evalPathC ps np b) 
evalPathC (L_rel p : ps) p' b    = let np = (fst p' + fst p, snd p' + snd p)
                                   in np : (evalPathC ps np b)
evalPathC (L_abs p : ps) _ b     = p : (evalPathC ps p b)
evalPathC (Complete p : ps) p' b = if b then evalPathC (L_abs p : ps) p' b else evalPathC (L_rel p : ps) p' b
evalPathC (Z : _) _ _            = []

-- ** Polígonos válidos - Chequeo de tipo **

checkCon :: Container -> Maybe Container
checkCon c 
    | p1x c == p2x c = Nothing
    | p1y c == p2y c = Nothing
    | otherwise      = Just c

-- Chequea si el polígono no se interseca a sí mismo y si tiene más de dos lados
checkPol :: Polygon -> Maybe Polygon 
checkPol p = if check3sides p
             then if checkIntersections p 
                  then Nothing
                  else Just p 
             else Nothing

check3sides :: Polygon -> Bool
check3sides po = length (p po) >= 3

checkIntersections :: Polygon -> Bool
checkIntersections pol = length (BO.intersections (toLSegments (points ++ [head points]))) /= length points
    where points = p pol

toLSegments :: [MyPoint] -> [LineSegment 2 () Float] 
toLSegments [x]        = [] 
toLSegments (x:(y:ys)) = (ClosedLineSegment (point2 (fst x) (snd x) :+ ()) (point2 (fst y) (snd y) :+ ())) : (toLSegments (y:ys))

-- Chequea si el polígono no se interseca a sí mismo y si tiene más de dos lados
-- Necesaria por problemas con las funciones del módulo BO
checkPolSlow :: Polygon -> Maybe Polygon 
checkPolSlow p = if check3sides p
                 then if checkIntersectionsSlow p 
                      then Nothing
                      else Just p 
                 else Nothing

checkIntersectionsSlow :: Polygon -> Bool
checkIntersectionsSlow po = cIS (getSegs (p po ++ [head (p po)])) 

cIS :: [(MyPoint, MyPoint)] -> Bool
cIS []     = False
cIS (x:xs) = Eval.compare x xs || cIS xs

-- Chequea si las proyecciones en el eje de las ordenadas y las abscisas se intersecan
compare :: (MyPoint, MyPoint) -> [(MyPoint, MyPoint)] -> Bool
compare x []     = False
compare x (y:ys) = case intersectSegSeg (fst x) (snd x) (fst y) (snd y) of
                    Just v -> if abs (fst v - fst (snd x)) <= 0.001 && abs (snd v - snd (snd x)) <= 0.001 
                                 || abs (fst v - fst (fst x)) <= 0.001 && abs (snd v - snd (fst x)) <= 0.001
                              then Eval.compare x ys
                              else True
                    _      -> Eval.compare x ys

getSegs :: [MyPoint] -> [(MyPoint, MyPoint)]
getSegs [x]        = []
getSegs (x:(y:ys)) = (x,y) : (getSegs (y:ys))

