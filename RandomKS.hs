module RandomKS where
import Core
import Data.List(nub)
import System.Random(mkStdGen,randomR,randomRs)
import Binarios


--Esta función genera un modelo aleatorio con 2^n estados a partir de una lista de semillas.
randomKS::Int->[Int]->KripkeS
randomKS n rs = KS (2^n-1,r_random,l_random) where
                  r_random = \s -> let g = mkStdGen (rs !! s) 
                                       m = fst $ randomR (1,n^2) g in 
                                   nub $ take m $ randomRs (0,2^n - 1) g                
                  l_random = \s pj -> if ""==pj then False else
                             let bss = statesbin n in 
                             (bss !! s) !! (read $ tail $ pj) 
                                      
                                      