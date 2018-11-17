import networkx as nx

if __name__ == '__main__':
    # definir dados
    soma = 0

    # instanciando o grafo
    G = nx.Graph()

    # lendo n
    n = int(input())

    # pegando as posicoes
    posicoes = [int(i) for i in input().split()]

    # tirando cartas duplicadas
    cartas = set(posicoes)

    for i in range(n-1):
        # lendo elementos
        s, t = [int(i) for i in input().split()]

        # adicionando vertices
        G.add_edge(s, t)
    # end for

    for i in cartas:
        source = posicoes.index(i) + 1

        target = len(posicoes) - posicoes[-1::-1].index(i)

        soma = soma + nx.shortest_path_length(G, source, target)
    # end for

    print(soma)
# end main
