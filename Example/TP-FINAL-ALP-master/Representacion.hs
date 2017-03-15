
module Representacion where

import Data.Time
-- TIPOS DE DATOS
data Error = Ok | Err String
	deriving (Show,Eq)
	
data Typ = TNumeric | TString | TDate | TBoolean | TUnit
	deriving (Show)


instance Eq Typ where
	TNumeric == TNumeric    = True
	TString == TString      = True
	TDate   == TDate        = True
	TBoolean == TBoolean    = True
	TUnit == TUnit          = True
	x == TUnit		= True
	TUnit == y		= True
	x == y			= False
	
	
type Celda = (String, Int)

-- AST
data Exp = Str String
	 | Fl Float
	 | Bo Bool
	 | Date Day
	 | Eval ExpEval
	 | Unit ()
       deriving(Show,Eq)

data ExpEval  = SimboloLigadura -- usado para expresiones "cuantificadas" 
              | Var Celda
	      | Ran Celda Celda
	      | EStr String
	      | EFl Float
	      | EBo Bool
	      | EDate Day
	      -- Funciones de Fechas
	      | Hoy
	      | DiasEntre ExpEval ExpEval 
	      | DiaPascua ExpEval
	      | CantYears ExpEval ExpEval
	      -- Operaciones Matematicas
	      | Mas ExpEval ExpEval
	      | Menos ExpEval ExpEval
	      | Por ExpEval ExpEval
	      | Div ExpEval ExpEval
	      -- Comparaciones Matematicas 
	      | Ig ExpEval ExpEval
	      | Menor ExpEval ExpEval
	      | Mayor ExpEval ExpEval
	      | MenorIg ExpEval ExpEval
	      | MayorIg ExpEval ExpEval
	      -- Operaciones Logicas
	      | And ExpEval ExpEval
	      | Or ExpEval ExpEval
	      -- Sentencias
	      | Si ExpEval ExpEval ExpEval
	      | ContarSi ExpEval ExpEval
	      -- Funciones Matematicas
	      | Potencia ExpEval ExpEval
	      | Opuesto ExpEval
	      | Suma [ExpEval]
	      | Abs ExpEval
	      -- Funciones Strings
	      | Concat [ExpEval]
	      -- Funciones Estadisticas
	      | DistrExpN ExpEval ExpEval ExpEval
	deriving(Show,Eq)






sustituirSimb :: Celda -> ExpEval -> ExpEval
sustituirSimb c SimboloLigadura = Var c
sustituirSimb c (Mas e1 e2) = Mas (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Menos e1 e2) = Menos (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Por e1 e2) = Por (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Div e1 e2) = Div (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Ig e1 e2) = Ig (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Menor e1 e2) = Menor (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Mayor e1 e2) = Mayor (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (MenorIg e1 e2) = MenorIg (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (MayorIg e1 e2) = MayorIg (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (And e1 e2) = And (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Or e1 e2) = Or (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Si e1 e2 e3) = Si (sustituirSimb c e1) (sustituirSimb c e2) (sustituirSimb c e3)
sustituirSimb c (Potencia e1 e2) = Potencia (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (ContarSi e1 e2) = ContarSi (sustituirSimb c e1) (sustituirSimb c e2)
sustituirSimb c (Opuesto e) = Opuesto (sustituirSimb c e)
sustituirSimb c (Suma xs) = Suma (map (\i -> sustituirSimb c i) xs)
sustituirSimb c (Abs e) = Abs (sustituirSimb c e)
sustituirSimb c (Concat xs) = Concat (map (\i -> sustituirSimb c i) xs)
sustituirSimb c exp = exp


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
{- 	

Gramatica para expresiones de un lenguaje de hoja de calculo

C ::= [String,Int]

A ::= C := E

V ::= F Float
    | S String
    | B Bool
    | Cero

E ::= Valor V
    | = E1
    
E1 ::= E1 + T
     | E1 - T
     | E1 < E1
     | E1 <= E1
     | E1 > E1
     | E1 >= E1
     | E1 == E1
     | T

T ::= T * F
    | T / F
    | F

F ::= suma(E2
    | abs(E1)
    | concat(E2
    | Y(E2
    | O(E2
    | SI(E1,E1,E1)
    | NO(E1)
    | derecha(E1,E1)
    | V
    | C

E2 ::= E1,E2
     | E1)



Gramatica para expresiones de un lenguaje de hoja de calculo

C ::= [String,Int]

A ::= C := E

V ::= F Float
    | S String
    | B Bool
    
E ::= Valor V
    | = E1
    

E1 ::= T E1'
E1' ::= € 
       | + T E1'
       | - T E1'
       | < E1 E1'
       | <= E1 E1'
       | > E1 E1'
       | >= E1 E1'
       | == E1 E1'

T ::= F T'
T' ::= €
     | * F T'
     | / F T'


F ::= suma(E2
    | (E1)
    | abs(E1)
    | concat(E2
    | Y(E2
    | O(E2
    | SI(E1,E1,E1)
    | NO(E1)
    | derecha(E1,E1)
    | V 
    | C

E2 ::= E1,E2
     | E1)

-}


