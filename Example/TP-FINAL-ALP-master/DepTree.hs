module DepTree where

import Data.Char
import qualified Data.Set as S
import qualified Data.List as L
import qualified HashTables as HT
import Representacion
import Valores


-- Estructura que representa la informacion de una celda
data InfoCelda = IC {
		     celda :: Celda,
		     strexpr :: String,
		     valor :: Valor , 
		     typ :: Typ
		    }
		deriving (Show,Eq)

instance Ord InfoCelda where
	compare x y = compare (celda x) (celda y)


{- QUEUES -}
type Queue = [Celda]



enqueue :: Celda -> Queue -> IO Queue
enqueue x s = return (s++[x])

pop :: Queue -> IO (Celda,Queue)
pop (x:xs) = return (x,xs)

pushQueue :: S.Set Celda -> Queue -> IO Queue
pushQueue set q = return (L.nub (q ++ S.elems set))


-- El grafo, cuyos nodos son las celdas y la informacion, como la string que es ingresada, el valor y su tipo
-- El grafo es una tabla Hash donde las claves son celdas y los valores son conjunto de celdas. Este conjunto son todas
type Grafo = HT.HashTable InfoCelda (S.Set Celda)

class Monad m => MonadGrafo m where
	--funciones de consulta del grafo
	encontrarTipo :: Celda -> Grafo -> m Typ
	encontrarValor :: Celda -> Grafo -> m Valor
	encontrarString :: Celda -> Grafo -> m String
	infocelda :: Celda -> Grafo -> m InfoCelda
	obtenerVecinos :: Grafo -> InfoCelda -> m [InfoCelda] 
	--funcion que devuelve un valor de tipo InfoCelda dada la celda, el tipo, la string y su valor
	crearInfo :: Celda -> Typ -> String -> Valor -> m InfoCelda
	--funcion que devuelve un nuevo grafo
	nuevoGrafo :: m Grafo
	--funciones de modificaciones
	actualizarCelda :: Celda -> Typ -> String -> Valor -> Grafo -> m ()
	eliminarVecinos :: Grafo -> InfoCelda -> m ()
	ginsertaCelda :: InfoCelda -> Grafo -> m ()
	ginsertaDependencia :: InfoCelda -> InfoCelda -> Grafo -> m ()
	gremoverDependencia :: InfoCelda -> InfoCelda -> Grafo -> m ()
	aplicar :: Grafo -> (InfoCelda -> m ()) -> m ()
	aplicaLista :: [a] -> (a -> m ()) -> m ()
	bfs :: Celda -> Grafo -> (Celda -> Grafo -> m ()) -> m Grafo
	bfs2 :: Celda -> Grafo -> m [Celda]
	existeCamino :: Celda -> Celda -> Grafo -> m Bool

{- Usamos la instancia en IO -}
instance MonadGrafo IO where
-- dada una celda y un grafo, busca la informacion de la celda
	encontrarTipo c g = do xs <- HT.toList g
			       if xs == [] then return TUnit else let listUnit = filter (\i -> celda (fst i) == c) xs in
								      if listUnit == [] then return TUnit
										        else let elem     = listUnit!!0
			 								         result   = typ (fst elem)
										             in return result

	encontrarValor c g = do xs <- HT.toList g
		 	        if xs == [] then return nuevoValor else let listUnit = filter (\i -> celda (fst i) == c) xs in
								            if listUnit == [] then return nuevoValor 
											      else let elem     = listUnit!!0
			 								               result   = valor (fst elem)
										                   in return result

	encontrarString c g = do xs <- HT.toList g
		 	         if xs == [] then return "" else let listUnit = filter (\i -> celda (fst i) == c) xs in
								     if listUnit == [] then return "" 
										       else let elem     = listUnit!!0
			 								        result   = strexpr (fst elem)
										            in return result

-- dado una celda y un grafo busca su información en el grafo

	infocelda c g = do ty <- encontrarTipo c g
			   val <- encontrarValor c g
			   str <- encontrarString c g
			   let info = IC {celda = c, typ = ty, strexpr = str, valor = val} in return info

-- dada una celda en un grafo, devuelve la lista de todos los vecinos del mismo 

	obtenerVecinos g ic = do t <- HT.toList g
			 	 let t' = map (\(k,v) -> k) (filter (\(k,v) -> S.member (celda ic) v) t) in return t'

-- dada una celda, un tipo, una string y un valor, los agrupa en un InfoCelda

	crearInfo c t s v = let info = IC {celda = c, typ = t , strexpr = s , valor = v} in return info




-- dado una celda, una expresión , una string, y un valor actualiza la info de una celda en el grafo

	actualizarCelda c t s v g = do infoVieja <- infocelda c g 
				       maybeset <- HT.lookup g infoVieja
				       case maybeset of
					    Nothing -> do infoNueva <- crearInfo c t s v
						          ginsertaCelda infoNueva g 
					    Just set -> do HT.delete g infoVieja
						           infoNueva <- crearInfo c t s v
						           HT.insert g infoNueva set

-- devuelve un grafo vacio

	nuevoGrafo = HT.new (\x y -> celda x == celda y) (\x -> HT.hashString (fst (celda x)) + HT.hashInt (snd (celda x)))


-- inserta una nueva celda al grafo, si existe, simplemente no hace nada

	ginsertaCelda v g = do maybeset <- HT.lookup g v
			       case maybeset of
			           Nothing -> HT.insert g v (S.empty) 
			           Just set -> return ()

-- dadas dos celdas y un grafo, inserta una dependencia dirigida desde v' a v. Es decir que v depende de v'

	ginsertaDependencia v v' g = do maybeset1 <- HT.lookup g v
				        maybeset2 <- HT.lookup g v'
				        case maybeset1 of
				              Nothing -> do ginsertaCelda v g
						            ginsertaDependencia v v' g
				              Just set1 -> case maybeset2 of
					                      Nothing -> do ginsertaCelda v' g
						                            ginsertaDependencia v v' g
					      		      Just set2 -> do b1 <- HT.update g v (S.insert (celda v') set2)
							      		      return ()

-- dadas dos celdas y un grafo, elimina la dependencia v' -> v

	gremoverDependencia v v' g = do maybeset1 <- HT.lookup g v
				        maybeset2 <- HT.lookup g v'
				        case maybeset1 of
				              Nothing -> return ()
				              Just set1 -> case maybeset2 of
					                     Nothing -> return ()
					                     Just set2 -> do b1 <- HT.update g v (S.delete (celda v') set1)
							                     return ()
	

-- dada una celda y un grafo, elimina todos los vecinos del grafo g
	eliminarVecinos g ic = do t <- obtenerVecinos g ic
				  aplicaLista t (\x -> gremoverDependencia x ic g)

-- modifica todos los elementos de un grafo

	aplicar g f = do xs <- HT.toList g
		         app' (map (\(a,b) -> a) xs) f
		       where app' [] f = return ()
			     app' (x:xs) f = do f x
					        app' xs f


-- transforma el valor de una lista
	aplicaLista [] f = return ()
	aplicaLista (x:xs) f = do f x
			          aplicaLista xs f
		    
-- BFS
	bfs i g func = do g <- bfs' i g [] func
			  return g
		where bfs' celda grafo queue funcion = do queue <- pushQueue (S.singleton celda) queue
							  grafo <- bfs'' grafo queue S.empty funcion
							  return grafo
		      bfs'' grafo [] visitados funcion = return grafo
		      bfs'' grafo queue visitados funcion = do (celda',queue') <- pop queue
							       if S.notMember celda' visitados then(do info <- infocelda celda' grafo
												       maybeset <- HT.lookup grafo info
												       case maybeset of
													   Nothing -> return grafo
													   Just set -> (do queue <- pushQueue set queue
															   funcion celda' grafo
															   grafo <- bfs'' grafo queue (S.insert celda' visitados) funcion
															   return grafo
														       ))
											       else do grafo <- bfs'' grafo queue' visitados funcion
												       return grafo 

-- OTRO BFS, este devuelve la lista de las celdas recorridas
	bfs2 i g = do xs <- bfs2' i g []
		      return xs
	 	where bfs2' celda grafo queue = do queue <- pushQueue (S.singleton celda) queue
						   xs <- bfs2'' grafo queue S.empty
						   return xs
		      bfs2'' grafo [] visitados = return []
		      bfs2'' grafo queue visitados = do (celda', queue') <- pop queue
							if S.notMember celda' visitados then(do info <- infocelda celda' grafo
												maybeset <- HT.lookup g info
												case maybeset of
												     Nothing -> return []
												     Just set ->(do queue <- pushQueue set queue
														    xs <- bfs2'' grafo queue (S.insert celda' visitados)
		      												    return (celda':xs)
														))
											else (do xs <- bfs2'' grafo queue' visitados
												 return xs)



-- EXISTE CAMINO

	existeCamino x y g = do xs <- bfs2 x g
			        if elem y xs then return True else return False

