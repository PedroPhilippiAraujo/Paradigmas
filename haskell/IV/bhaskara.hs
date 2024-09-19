bhaskara :: Float -> Float -> Float -> Float
bhaskara a b c = (((-b) * sqrt(b^2 - 4*a*c))/(2*a))



main = do
    aString <- getLine
    bString <- getLine
    cString <- getLine
    let a = (read aString :: Float)
    let b = (read bString :: Float)
    let c = (read cString :: Float)
    print (bhaskara a b c)
