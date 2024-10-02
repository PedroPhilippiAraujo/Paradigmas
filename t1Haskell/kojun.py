def testeuno():
    for i in range(0, len(tamanhoregioes)):
        if tamanhoregioes[i] == 1:
            for j in range(0, len(gridregiao)):
                for k in range(0, len(gridregiao)):
                    if gridregiao[j][k] == i+1:
                        grid[j][k] = 1
                        gridinit[j][k] = 1
                        

def choice(linha,coluna):
    if gridinit[linha][coluna] == 0:
        regiaocel = gridregiao[linha][coluna]
        for i in range(1, tamanhoregioes[regiaocel-1]+1):
            if ((coluna == 0) or (i != grid[linha][coluna-1])) and ((coluna == tamanhogrid-1 or i != grid[linha][coluna+1])):
                if (linha == 0) or (regiaocel == gridregiao[linha-1][coluna] and i < grid[linha-1][coluna]) or  (regiaocel != gridregiao[linha-1][coluna] and i != grid[linha-1][coluna]):
                    if (linha == tamanhogrid-1) or (regiaocel == gridregiao[linha+1][coluna] and i > grid[linha+1][coluna]) or (regiaocel != gridregiao[linha+1][coluna] and i != grid[linha+1][coluna]):

                        grid[linha][coluna] = i
                        

                        if linha == tamanhogrid-1 and coluna == tamanhogrid-1:
                            return 0
                        elif linha != tamanhogrid-1 and coluna == tamanhogrid-1:
                            choice(linha+1, 0)
                        else:
                            choice(linha,coluna+1)
    else:
        if linha != tamanhogrid-1 and coluna != tamanhogrid-1:
            choice(linha,coluna+1)
        elif linha != tamanhogrid-1 and coluna == tamanhogrid-1:
            choice(linha+1, 0)
        else:
            return 0
                
            
    

grid = [[2,0,0,0,1,0],[0,0,0,3,0,0],[0,3,0,0,5,3],[0,0,0,0,0,0],[0,0,3,0,4,2],[0,0,0,0,0,0]] # Grid Entrada
gridregiao = [[1,1,2,2,2,3],[4,4,4,4,4,3],[5,6,6,6,4,7],[5,5,5,6,7,7],[8,8,9,10,10,10],[11,11,9,9,10,10]] #Grid de Regiões da Entrada

print (grid)
tamanhogrid = len(grid) # Grid NxN
maxregiao = 0 # inicializa o tamanho em 0

gridinit = grid #Faz uma copia do grid para referencia de valores pre colocados

for i in gridregiao:
    for j in i:
        if j > maxregiao:
            maxregiao = j #descobrir qual eh o numero de regioes de um tabuleiro
            
tamanhoregioes = [0]*maxregiao # inicializa lista de tamanho de regioes

for i in gridregiao:
    for j in i:
        if j != 0:
            tamanhoregioes[j-1] +=1 #conta a quantidade de vezes que uma regiao aparece, afim de descobrir o tamanho dela
            

    
testeuno() #preenche todos os espacos de tamanho 1

choice(0,0) #funcao recursiva

for i in grid:
    print (i)