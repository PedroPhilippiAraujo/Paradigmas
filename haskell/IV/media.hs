funcaoMedia :: Float -> Float -> Float -> String
funcaoMedia a b c | ((a+b+c)/3) >= 6 = "Aprovado"
            | otherwise = "Reprovado"

main = do
    aString <- getLine
    bString <- getLine
    cString <- getLine
    let notaA = (read aString :: Float)
    let notaB = (read bString :: Float)
    let notaC = (read cString :: Float)
    print (funcaoMedia notaA notaB notaC)
