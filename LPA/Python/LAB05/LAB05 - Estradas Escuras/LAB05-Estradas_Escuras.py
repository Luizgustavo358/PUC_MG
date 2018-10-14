import networkx as nx
import matplotlib.pyplot as plt


def mostra(grafo):
    nx.draw(grafo)
    plt.show()
# end mostra()


if __name__ == "__main__":
    # lendo linha
    linha = input("")

    # separando
    n, m = linha.split(" ")

    # transformando em inteiro
    n = int(n)
    m = int(m)

    # criando grafo
    G = nx.Graph()

    for i in range(0, m):
        # lendo linha
        linha = input("")

        # separando
        u, v, w = linha.split(" ")

        # adicionando arestas com peso
        G.add_edge(int(u), int(v), weight=int(w))
    # end for

    mostra(G)

    print(G.edges.data('weight'))

    T = nx.minimum_spanning_tree(G)
    print(T.edges.data('weight'))

    new_graph = nx.difference(G, T)
    print(new_graph.edges.data('weight'))
# end main
