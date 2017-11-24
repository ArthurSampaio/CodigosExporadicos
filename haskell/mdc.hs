mdc :: Integer -> Integer -> Integer
mdc a b | b == 0 = a
        | otherwise = mdc b (a `mod` b)


main :: IO()
main = do
    n1 <- getLine
    n2 <- getLine
    putStrLn (show(mdc (read n1) (read n2)))