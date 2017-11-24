isPrime :: Integer -> Bool
isPrime n = loopPrime (floor $ sqrt $ fromIntegral n) 2
        where loopPrime value iter 
                | iter > value           = True
                | (n `mod` iter) == 0 = False
                | otherwise               = loopPrime value (iter+1) --propertie tail call




main :: IO()
main = do
        n_char <- getLine
        let n = (read n_char)
        putStrLn(show(isPrime n))