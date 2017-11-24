
balsa_valor :: String -> Double -> Double
balsa_valor automovel qtd_pessoas 
    | (automovel == "carro") = 5 + (calcula_valor_pessoa)
    | (automovel == "motor") = 2 + (calcula_valor_pessoa)
    | (automovel == "van") = 15 + (calcula_valor_pessoa)
    | (automovel == "onibus") = 50 + (calcula_valor_pessoa)
    where calcula_valor_pessoa = qtd_pessoas * 1.5

                                    
main :: IO()
main = do 
    veiculo <- getLine
    pessoa <-getLine
    let pessoas = (read pessoa)
    putStrLn(show(balsa_valor veiculo pessoas))