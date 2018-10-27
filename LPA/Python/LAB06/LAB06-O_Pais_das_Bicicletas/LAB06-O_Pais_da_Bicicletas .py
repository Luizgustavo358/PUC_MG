# LAB06-Bicicletas - arvore geradora minima
import networkx as nx
import matplotlib.pyplot as plt


def show_graph(g):
    graph = nx.Graph(g)

    pos = nx.circular_layout(graph)

    nx.draw_networkx_nodes(graph, pos, node_color='r', node_size=500, alpha=0.8)

    nx.draw_networkx_edges(graph, pos, width=1, alpha=0.5)

    plt.show()
# end show_graph()


def le_linha():
    linha = input("")

    return linha
# end le_linha()


def prim(origem, destino, Grafo):
    print()
# end prim()


if __name__ == '__main__':
    # lendo linha
    linha = le_linha()

    # le a linha ate' ser diferente de 0 0
    while linha != "0 0":
        # instancia
        h = 1

        n, m = linha.split(" ")

        # convertendo
        n = int(n)  # n = numero de intersecao
        m = int(m)  # m = numero de ruas

        # instancia grafo
        G = nx.Graph()

        for i in range(0, m):
            # le insercoes
            linha = input("u, v, w = ")

            # dando o split
            u, v, w = linha.split(" ")

            G.add_edge(int(u), int(v), weigth=int(w))
            G.add_edge(int(v), int(u), weigth=int(w))
        # end for

        # show_graph(G)
        
        # k = numero de pares
        k = le_linha()

        k = int(k)

        for i in range(0, k):
            # lendo pares
            linha = le_linha()

            # separando por espaco
            origem, destino = linha.split(" ")

            # mostrando as maiores alturas encontradas
            print("Instancia", h)

            prim(origem, destino, G)

            # incrementa a instancia
            h = h + 1
        # end for

        # lendo linha
        linha = le_linha()
    # end while
# end main
