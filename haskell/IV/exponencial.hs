main = do
    xString <- getLine
    yString <- getLine
    let x = (read xString :: Float)
    let y = (read yString :: Float)
    let resultado = x**y
    print (resultado)
