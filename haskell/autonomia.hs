main :: IO()
main = do
    lts <- getLine
    mean <- getLine
    putStrLn(show ((read lts) * (read mean)))