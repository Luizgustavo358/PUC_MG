import networkx as nx
import matplotlib.pyplot as plt


def mostra(grafo):
    nx.draw(grafo)
    plt.show()
# end mostra()


if __name__ == "__main__":
    # lendo linha
    linha = input("")

    while linha != "0 0":
        # separando
        m, n = linha.split(" ")

        # transformando em inteiro
        m = int(m)
        n = int(n)

        # criando grafo
        G = nx.Graph()

        for i in range(0, n):
            # lendo linha
            linha = input("")

            # separando
            u, v, w = linha.split(" ")

            # adicionando arestas com peso
            G.add_edge(int(u), int(v), weight=int(w))
        # end for

        print(G.edges.data('weight'))

        T = nx.minimum_spanning_tree(G)
        print(T.edges.data('weight'))

        new_graph = nx.difference(G, T)
        print(new_graph.edges.data('weight'))
# end main
