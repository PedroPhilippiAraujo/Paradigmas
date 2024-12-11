blusa(amarela).
blusa(azul).
blusa(branca).
blusa(verde).
blusa(vermelha).

nome(aline).
nome(carol).
nome(fernanda).
nome(juliana).
nome(natalia).

esqueceu(amaciante).
esqueceu(frutas).
esqueceu(leite).
esqueceu(pao).
esqueceu(presunto).

pagamento(cheque).
pagamento(credito).
pagamento(debito).
pagamento(dinheiro).
pagamento(vale).

foicom(filho).
foicom(irma).
foicom(mae).
foicom(marido).
foicom(namorado).

carro(crossover).
carro(hatch).
carro(pickup).
carro(sedan).
carro(suv).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
%X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
%X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    ListaSolucao = [
        caixa(Blusa1, Nome1, Esqueceu1, Pagamento1, Foicom1, Carro1),
        caixa(Blusa2, Nome2, Esqueceu2, Pagamento2, Foicom2, Carro2),
        caixa(Blusa3, Nome3, Esqueceu3, Pagamento3, Foicom3, Carro3),
        caixa(Blusa4, Nome4, Esqueceu4, Pagamento4, Foicom4, Carro4),
        caixa(Blusa5, Nome5, Esqueceu5, Pagamento5, Foicom5, Carro5)
    ],

    %A mulher que esqueceu o Amaciante está exatamente à esquerda da que foi dirigindo um Sedan.
    %??? aolado+aesquerda
    
    %Juliana foi ao supermercado com a Mãe.
    member(caixa(_,juliana,_,_,mae,_), ListaSolucao),
    
    %Quem foi num Crossover está exatamente à direita de quem vai pagar no cartão de Débito.
    %??? aolado+adireita
    
    %Quem esqueceu o Presunto vai pagar com o cartão de Débito.
    member(caixa(_,_,presunto,debito,_,_), ListaSolucao),
    
    %A mulher que foi com o Namorado foi fazer as compras dirigindo uma Pickup.
    member(caixa(_,_,_,_,namorado,pickup), ListaSolucao),
    
    %A mulher da blusa Amarela está ao lado da que esqueceu as Frutas.
    aoLado(caixa(amarela,_,_,_,_,_), caixa(_,_,frutas,_,_,_), ListaSolucao),
    
    %A dona do Sedan está exatamente à esquerda da dona do SUV.
    %???
    
    %Quem esqueceu o Pão foi ao supermercado dirigindo um SUV.
    member(caixa(_,_,pao,_,_,suv), ListaSolucao),
    
    %Quem esqueceu o Pão foi com a Mãe.
    member(caixa(_,_,pao,_,mae,_), ListaSolucao),
    
    %Fernanda foi para o supermercado com o Filho.
    member(caixa(_,fernanda,_,_,filho,_), ListaSolucao),
    
    %Aline está ao lado da mulher que foi ao supermercado com o Filho.
    aoLado(caixa(_,aline,_,_,_,_), caixa(_,_,_,_,filho,_), ListaSolucao),
    
    %Carol está exatamente à direita da mulher que esqueceu o Amaciante.
    %???
    
    %A mulher da blusa Azul está no quarto caixa.
    Blusa4 = azul,
    
    %Em um dos caixas da pontas está a mulher que foi ao supermercado com o Marido.
    
    %A mulher da blusa Verde está em algum lugar à esquerda da de blusa Vermelha.
    
    %No caixa da quarta posição está a mulher que vai pagar com Cheque.
    
    %A mulher da blusa Verde está em algum lugar à esquerda da de blusa Vermelha.
    
    %Quem vai pagar com Dinheiro está em um dos caixas das pontas.
    
    %Quem esqueceu as Frutas está ao lado de quem esqueceu o Presunto.
    
    %A mulher que vai pagar com o cartão de Débito está exatamente à esquerda de quem vai pagar com Vale.
    
    %A mulher da blusa Amarela está em algum lugar entre a que foi com o Marido e a de blusa Verde, nessa ordem.
    %adireita+aesquerda
    
    %Quem vai pagar com Dinheiro está ao lado de quem foi de Sedan ao supermercado.
    
    %-------------------------------------------------------------------
    
    %O navio Grego sai às 6 da manhã e carrega Café.
    member(navio(grego, 6, cafe, _, _), ListaSolucao),

    %O navio do meio tem a chaminé Preta.
    Chamine3 = preta,
    
    %O navio Inglês sai às 9 da manhã.
    member(navio(ingles, 9, _, _, _), ListaSolucao),
    
    %O navio Francês, que tem a chaminé Azul, está à esquerda do navio que carrega Café
    aEsquerda(navio(frances, _, _, azul, _), navio(_, _, cafe, _, _), ListaSolucao),
    
    %À direita do navio que carrega Cacau está o navio que vai para Macau.
    aEsquerda(navio(_, _, cacau, _, _), navio(_, _, _, _, macau), ListaSolucao),
    
    %O navio Brasileiro está indo para Manila.
    member(navio(brasileiro, _, _, _, manila), ListaSolucao),
    
    %O navio que carrega Arroz está ancorado ao lado do navio com chaminé Verde.
    aoLado(navio(_, _, arroz, _, _), navio(_, _, _, verde, _), ListaSolucao),
    
    %O navio que vai para Santos sai às 5 da manhã.
    member(navio(_, 5, _, _, santos), ListaSolucao),
    
    %O navio Espanhol sai às 7 da manhã e está à direita do navio que vai para Macau.
    aDireita(navio(espanhol, 7, _, _, _), navio(_, _, _, _, macau), ListaSolucao),
    
    %O navio com a chaminé Vermelha vai para Hamburgo.
    member(navio(_, _, _, vermelha, hamburgo), ListaSolucao),
    
    %O navio que sai às 7 da manhã está ao lado do navio que tem a chaminé Branca.
    aoLado(navio(_, 7, _, _, _), navio(_, _, _, branca, _), ListaSolucao),
    
    %O navio do canto carrega Milho.
    noCanto(navio(_, _, milho, _, _),ListaSolucao),
    
    %O navio com chaminé Preta sai às 8 da manhã
    member(navio(_, 8, _, preta, _), ListaSolucao),
    
    %O navio que que carrega Milho está ancorado ao lado do navio que carrega Arroz.
    aoLado(navio(_, _, milho, _, _), navio(_, _, arroz, _, _), ListaSolucao),
    
    %O navio que vai para Hamburgo sai às 6 da manhã.
    member(navio(_, 6, _, _, hamburgo), ListaSolucao),
    
    %Testa todas as possibilidades...
    blusa(Blusa1), blusa(Blusa2), blusa(Blusa3), blusa(Blusa4), blusa(Blusa5),
    todosDiferentes([Blusa1, Blusa2, Blusa3, Blusa4, Blusa5]),
    
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),
    
    esqueceu(Esqueceu1), esqueceu(Esqueceu2), esqueceu(Esqueceu3), esqueceu(Esqueceu4), esqueceu(Esqueceu5),
    todosDiferentes([Esqueceu1, Esqueceu2, Esqueceu3, Esqueceu4, Esqueceu5]),
    
    pagamento(Pagamento1), pagamento(Pagamento2), pagamento(Pagamento3), pagamento(Pagamento4), pagamento(Pagamento5),
    todosDiferentes([Pagamento1, Pagamento2, Pagamento3, Pagamento4, Pagamento5]),
    
    foicom(Foicom1), foicom(Foicom2), foicom(Foicom3), foicom(Foicom4), foicom(Foicom5),
    todosDiferentes([Foicom1, Foicom2, Foicom3, Foicom4, Foicom5]),

	carro(Carro1), carro(Carro2), carro(Carro3), carro(Carro4), carro(Carro5),
    todosDiferentes([Carro1, Carro2, Carro3, Carro4, Carro5]).
    