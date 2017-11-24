lanchonete :: String -> Double
lanchonete lanche | (lanche == "pastel") = 2.0
                  | (lanche == "coxinha") = 2.5
                  | (lanche == "suco") = 1.0
                  | otherwise = 3.0


main :: IO()
main = do 
        lanche <- getLine
        putStrLn(show(lanchonete lanche))