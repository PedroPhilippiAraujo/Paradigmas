areaTriangulo :: Float -> Float -> Float
areaTriangulo base altura = (base * altura) / 2


main = do
    baseString <- getLine
    alturaString <- getLine
    let base = (read baseString :: Float)
    let altura = (read alturaString :: Float)
    print (areaTriangulo base altura)
