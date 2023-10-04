{-# LANGUAGE ScopedTypeVariables #-}

module Main where

type Grid = Matrix Value -- Declaracao de grid (NxN)

type Matrix a = [Row a] -- Declaracao de matrix

type Row a = [a] -- declaracao de linha

type Value = Int -- declaracao de valor



blank :: Grid
blank = replicate 6 (replicate 6 0) -- Preenche um grid Vazio com o numero 0

construtorinicial :: Grid
  construtorinicial = [[2,0,0,0,1,0],[0,0,0,3,0,0],[0,3,0,0,5,3],[0,0,0,0,0,0],[0,0,3,0,4,2],[0,0,0,0,0,0]] -- construcao inicial do grid de regioes

construtorregioes :: Grid
  construtorregioes = [[1,1,2,2,2,3],[4,4,4,4,4,3],[5,6,6,6,4,7],[5,5,5,6,7,7],[8,8,9,10,10,10],[11,11,9,9,10,10]] -- construcao inicial do grid de regioes

tamanhogrid :: Grid -> Int  
  tamanhogrid grid = length(grid)

--tamanhoregioes :: Grid -> Row
  --return 0

maxregiao :: Grid -> Int -- numero numero de regioes da matriz
  maxregiao grid = max(concat grid)





solve :: Matrix a -> String -> String -> Matrix a --recebe a matriz original + adj hori + adj vert para saida da matriz resolvida com o algoritmo  

main = do

  let temp = (maxregiao construtorinicial)
  putStrLn (temp)




