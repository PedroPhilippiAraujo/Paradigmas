notaMedia :: Float -> Float -> Float -> String
notaMedia a b c | ((a+b+c)/3 >= 6.0) = "Aprovado"
                | ((a+b+c)/3 < 6.0) = "Reprovado"


main = do
    aString <- getLine
    bString <- getLine
    cString <- getLine
    let a = (read aString :: Float)
    let b = (read bString :: Float)
    let c = (read cString :: Float)
    print (notaMedia a b c)
