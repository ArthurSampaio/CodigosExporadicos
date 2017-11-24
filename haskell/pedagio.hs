pedagio :: String -> Double -> Double -> IO()
pedagio veiculo qtd_veiculo caixa = do 
    veiculo <- getLine
    if (veiculo == "fim") then do
        putStrLn (show caixa)
    else do
        qtd_veiculo <- getLine
        let qtd = (read qtd_veiculo)

        if (veiculo == "carro") then do 
            pedagio veiculo qtd ((qtd*5.5) + caixa) 
        else if (veiculo == "caminhao") then do 
            pedagio veiculo qtd ((qtd*12.5) + caixa)
        else if (veiculo == "van") then do 
            pedagio veiculo qtd ((qtd*7.5) + caixa)
        else 
            pedagio veiculo qtd ((qtd*2.5) + caixa)

main = do
    pedagio "" 0.0 0.0