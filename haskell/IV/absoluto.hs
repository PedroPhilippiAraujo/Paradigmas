absoluto :: Float -> Float
absoluto x | (x >= 0) = x
           | (x < 0) = x * (-1)


main = do
    xString <- getLine
    let x = (read xString :: Float)
    print (absoluto x)
