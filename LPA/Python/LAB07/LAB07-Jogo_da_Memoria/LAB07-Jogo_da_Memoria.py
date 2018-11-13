import networkx as nx

if __name__ == '__main__':
    # instanciando o grafo
    G = nx.Graph()

    # lendo n
    n = int(input(""))

    # pegndo as posicoes
    posicoes = [int(i) for i in input("").split(" ")]

    # tirando
    cartas = set(posicoes)

    for i in range(0, n-1):
        s, t = [int(i) for i in input("").split(" ")]

        # adicionando vertices
        G.add_edge(s, t)
    # end for

    soma = 0

    for i in cartas:
        source = posicoes.index(i) + 1

        target = len(posicoes) - posicoes[-1::-1].index(i)

        soma = soma + nx.shortest_path_length(G, source, target)
    # end for

    print(soma)
# end main
