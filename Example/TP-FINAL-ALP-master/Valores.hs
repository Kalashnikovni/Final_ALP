module Valores where

import Representacion
import Data.Time
import System.IO.Error

data Valor = Val { 
		   num :: Float,
		   str :: String,
		   dat :: Day,
		   boo :: Bool,
		   err :: Error
		 }
	deriving (Show,Eq)

nuevoValor :: Valor
nuevoValor = Val { num = 0,
                   str = "",
                   dat = fromGregorian 0 0 0,
                   boo = True,
                   err = Ok
                 }
                 
                 
class (Monad m) => (MonadVal m) where
	returnBool :: Bool -> m (Typ,Valor)
	returnNum :: Float -> m (Typ,Valor)
	returnStr :: String -> m (Typ,Valor)
	returnDay :: Day -> m (Typ,Valor)
	newVal :: m (Typ,Valor)
	raiseErr :: String -> m (Typ,Valor)
	getBool :: (Typ,Valor) -> m Bool
	getNum :: (Typ,Valor) -> m Float
	getStr :: (Typ,Valor) -> m String
	getDay :: (Typ,Valor) -> m Day
	
    
    
instance MonadVal IO where
    returnBool b = let val = Val { num = 0,
		                           str = "",
		                           dat = fromGregorian 0 0 0,
		                           boo = b,
		                           err = Ok
		                        }
		           in return (TBoolean, val)
    returnNum n = let val = Val { num = n,
                                  str = "",
                                  dat = fromGregorian 0 0 0,
                                  boo = True,
                                  err = Ok
                                }
                  in return (TNumeric, val)
    returnStr s = let val = Val { num = 0,
                                  str = s,
                                  dat = fromGregorian 0 0 0,
                                  boo = True,
                                  err = Ok
                                }
                  in return (TString, val)
    returnDay d = let val = Val { num = 0,
                                  str = "",
                                  dat = d,
                                  boo = True,
                                  err = Ok
                               }
                  in return (TDate, val)
    newVal = let val = Val { num = 0,
                             str = "",
                             dat = fromGregorian 0 0 0,
                             boo = True,
                             err = Ok
                           }
             in return (TUnit,val)
    raiseErr s = let val = Val { num = 0,
                                 str = "",
                                 dat = fromGregorian 0 0 0,
                                 boo = True,
                                 err = Err s
                             }
               in return (TUnit, val)
    getBool (t,v) = (if t == TBoolean then
                        if err v == Ok then
                             return (boo v)
                        else case (err v) of 
                                 Err s -> ioError (userError s)
                     else ioError (userError "VALOR"))
    getNum (t,v) = (if t == TNumeric then
                        if err v == Ok then
                             return (num v)
                        else case (err v) of 
                                 Err s -> ioError (userError s)
                     else ioError (userError "VALOR"))
    getStr (t,v) = (if t == TString then
                        if err v == Ok then
                             return (str v)
                        else case (err v) of 
                                 Err s -> ioError (userError s)
                     else ioError (userError "VALOR"))
    getDay (t,v) = (if t == TDate then
                        if err v == Ok then
                             return (dat v)
                        else case (err v) of 
                                 Err s -> ioError (userError s)
                     else ioError (userError "VALOR"))
		  
