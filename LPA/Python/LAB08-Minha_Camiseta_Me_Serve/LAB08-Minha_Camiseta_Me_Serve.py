import networkx as nx
from networkx.algorithms import bipartite

if __name__ == '__main__':
    # lendo os casos
    casos = int(input(""))

    for i in range(0, casos):
        # instanciando o grafo
        G = nx.Graph()

        # lendo linha
        linha = input("")

        # separando elementos
        n, m = linha.split(" ")

        # convertendo para inteiro
        n = int(n)
        m = int(m)

        # adicionando no
        G.add_nodes_from(range(1, m), bipartite=0)

        for j in range(1, m+1):
            # lendo linha
            linha = input("")

            # separando elementos
            tam1, tam2 = linha.split(" ")

            # adicionando nos
            G.add_nodes_from([tam1, tam2], bipartite=1)

            # adicionando arestas
            G.add_edges_from([(j, tam1), (j, tam2)])
        # end for

        print("NO" if (len(bipartite.maximum_matching(G)) / 2 < m) else "YES")
    # end for
# end main
