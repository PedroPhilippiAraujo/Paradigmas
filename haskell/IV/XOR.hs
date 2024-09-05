funcaoXOR :: Bool -> Bool -> Bool
funcaoXOR x y | (x==y) = False
            | otherwise = True

main = print (funcaoXOR False True)
