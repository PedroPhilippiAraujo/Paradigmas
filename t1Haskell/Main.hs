{-# LANGUAGE ScopedTypeVariables #-}

module Main where

type Grid = Matrix Value -- Declaracao de grid (NxN)

type Matrix a = [Row a] -- Declaracao de matrix

type Row a = [a] -- declaracao de linha

type Value = Int -- declaracao de valor

gridinicial :: Grid
gridinicial = [[2, 0, 0, 0, 1, 0], [0, 0, 0, 3, 0, 0], [0, 3, 0, 0, 5, 3], [0, 0, 0, 0, 0, 0], [0, 0, 3, 0, 4, 2], [0, 0, 0, 0, 0, 0]] -- construcao inicial do grid de valores

gridfinal :: Grid -- Grid usado para fazer as comparacoes iniciais
gridfinal = gridinicial

gridregioes :: Grid
gridregioes = [[1,1,2,2,2,3],[4,4,4,4,4,3],[5,6,6,6,4,7],[5,5,5,6,7,7],[8,8,9,10,10,10],[11,11,9,9,10,10]] -- construcao inicial do grid de regioes



tamanhogrid :: Grid -> Int -- determina o tamanho do tabuleiro
tamanhogrid grid = length grid

maxregiao :: Grid -> Int --determina o numero de regioes do jogo
maxregiao grid = maximum (concat grid)

tamanhoregioes :: [Int] -- Lista que armazena o tamanho das regioes
tamanhoregioes = []


append :: Int -> [Int] -> [Int] -- append em lista
append a [] = [a]
append a (x:xs) = x : append a xs

insertAt :: Grid -> Int -> Int -> Int -> Grid -- insert na n posicao da matriz
let (ys, zs) = splitAt coluna (grid!!linha) in ys ++ [new_element] ++ (tail zs)


filltamregioes :: Int -> Int -> Grid -> [Int] -> [Int] --preenche a lista com o tamanho das regioes
if num <= maiorregiao then --for number in range 1, maiorregiao
  let temp = length (concat grid). filter (== num) -- conta a quantidade de numeros da mesma regiao
  tamanhoregioes = append(temp, tamanhoregioes) -- append na lista
  filltamregioes(num+1, maiorregiao, gridregioes,tamanhoregioes) -- recursao

-- inicial / linha / coluna/ grid regioes / iterador/ tamanho regioes / tamanhogrid / Grid retornado
solve :: Grid -> Int -> Int -> Grid -> Int -> [Int] -> Int -> Grid -- funcao que resolve o jogo 
if (gridinicial !! linha) !! coluna = 0 then --checa se a celula ja nao eh pre-preenchida
  let regiaocel = (gridregioes !! linha) !! coluna -- guarda regiao da celula
  if iterador <= tamanhoregioes !! regiaocel-1 then -- for i in range 1 tamanho regiao
    if ((coluna = 0) || (iterador /= ((gridfinal !! linha) !! coluna-1))) && ((coluna = tamanhogrid-1) || (iterador /= ((gridfinal !! linha) !! coluna+1))) then -- checa direita e esquerda
      if (linha = 0) || (regiaocel = ((gridregioes!!linha-1)!!coluna) && (iterador < ((gridfinal!!linha-1)!!coluna))) || (regiaocel /= ((gridregioes!!linha-1)!!coluna) && (iterador < (gridfinal!!linha-1)!!coluna)) then -- checa se o superior eh valido
        if (linha = tamanhogrid-1) || (regiaocel = ((gridregioes!!linha+1)!!coluna) && (iterador > ((gridfinal!!linha+1)!!coluna))) || (regiaocel /= ((gridregioes!!linha+1)!!coluna) && (iterador < (gridfinal!!linha+1)!!coluna)) then -- checa se inferior eh valido
          gridfinal = instertAt(gridfinal, linha, coluna, iterador) -- insere na lista
          if (linha = tamanhogrid -1) && (coluna = tamanhogrid -1) then
            return -- termina caso tenha chego no fim
          else if (linha /= tamanhogrid-1) && (coluna == tamanhogrid-1) then
            gridfinal = solve(gridinicial, linha+1,0,gridregioes,1,tamanhoregioes,tamanhogrid) -- passa para a proxima celula na proxima linha
          else
            gridfinal = solve(gridinicial,linha,coluna+1,gridregioes,1,tamanhoregioes,tamanhogrid) -- passa para proxima celula na mesma linha

  else
    gridfinal = solve(gridinicial,linha,coluna,gridregioes,iterador+1,tamanhoregioes,tamanhogrid) -- testa proximo numero do iterador

else
  if (linha = tamanhogrid -1) && (coluna = tamanhogrid -1) then
    return --termina caso tenha chego no fim
  else if (linha /= tamanhogrid-1) && (coluna == tamanhogrid-1) then
    gridfinal = solve(gridinicial, linha+1,0,gridregioes,1,tamanhoregioes,tamanhogrid) -- passa para a proxima celula na proxima linha
  else
    gridfinal = solve(gridinicial,linha,coluna+1,gridregioes,1,tamanhoregioes,tamanhogrid) -- passa para proxima celula na mesma linha

main = do
  let x = maxregiao gridregiao
  let y = tamanhogrid gridinicial
  tamanhoregioes = filltamregioes(1, x, gridregioes, tamanhoregioes)
  let solucao = solve(gridinicial, gridregioes, gridfinal,0,0,0,tamanhoregioes)

