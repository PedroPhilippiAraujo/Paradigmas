triangulo :: Int -> Int -> Int -> String
triangulo x y z | (abs(y-z) > x || x > (y+z)) = "Impossivel"
                | (abs(x-z) > y || y > (x+z)) = "Impossivel"
                | (abs(x-y) > z || z > (x+y)) = "Impossivel"
                | otherwise = "Possivel"


main = do
    xString <- getLine
    yString <- getLine
    zString <- getLine
    let x = (read xString :: Int)
    let y = (read yString :: Int)
    let z = (read zString :: Int)
    print (triangulo x y z)
