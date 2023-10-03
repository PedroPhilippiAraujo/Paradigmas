def testeuno():
    for i in range(0, len(tamanhoregioes)):
        if tamanhoregioes[i] == 1:
            for j in range(0, len(gridregiao)):
                for k in range(0, len(gridregiao)):
                    if gridregiao[j][k] == i+1:
                        grid[j][k] = 1
                        

def choice(linha,coluna):
    regiaocel = gridregiao[linha][coluna]
    for i in range(1, tamanhoregioes[regiaocel-1]+1):
        if ((coluna == 0) or (i != grid[linha][coluna-1])) and ((coluna == tamanhogrid-1 or i != grid[linha][coluna+1])):
            if ((linha == 0) or (i < grid[linha-1][coluna])) and ((linha == tamanhogrid-1) or (regiaocel = gridregiao[linha+1][coluna] and i > grid[linha+1][coluna])):
                grid[linha][coluna] = i
                if linha != tamanhogrid-1 and coluna != tamanhogrid-1:
                    choice(linha,coluna+1)
                elif linha != tamanhogrid-1 and coluna == tamanhogrid-1:
                    choice(linha+1, 0)
                else:
                    break
    
                
            
    

grid = [[0,0,0,0,0,0,0,0], [0,1,3,0,0,0,0,0], [0,0,0,0,0,3,0,0], [0,0,3,0,0,0,0,0], [0,5,0,3,0,0,0,0], [0,2,0,0,0,0,0,0], [0,0,0,0,0,0,3,0], [0,0,5,3,0,0,0,0]]
gridregiao = [[1,1,2,2,3,4,5,5], [1,1,6,2,7,4,4,5], [6,6,6,8,7,9,10,10], [11,11,11,8,7,9,9,10], [12,8,8,8,8,9,9,10], [12,13,14,14,14,15,16,10], [13,13,13,13,17,15,15,15], [18,17,17,17,17,15,19,19]]


tamanhogrid = len(grid) #
maxregiao = 0 # inicializa o tamanho em 0

for i in gridregiao:
    for j in i:
        if j > maxregiao:
            maxregiao = j
            
tamanhoregioes = [0]*maxregiao

for i in gridregiao:
    for j in i:
        if j != 0:
            tamanhoregioes[j-1] +=1
            
            
    
testeuno()

choice(0,0)

for i in grid:
    print (i)