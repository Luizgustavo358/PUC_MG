import networkx as nx
import matplotlib.pyplot as plt


def mostra(grafo):
    nx.draw(grafo)
    plt.show()
# end mostra()


''' 
    Main
    N = numero total de empresas clientes
    P = total de pares
    K = conexoes
'''
if __name__ == '__main__':
    # lendo linha
    linha = input("")

    # le ate' ser diferente de 0 0 0
    while linha != "0 0 0":
        # pegando cada variavel
        n, p, k = linha.split(" ")

        # converte pra inteiro
        n = int(n)
        p = int(p)
        k = int(k)

        # declara o grafo
        Grafo = nx.Graph()

        for i in range(0, p):
            # le conjunto
            conjunto = input("")

            # da o split
            a, b = conjunto.split(" ")

            # transforma em inteiro
            a = int(a)
            b = int(b)

            # adiciona no grafo
            Grafo.add_edge(a, b)
        # end for

        # pegando node para remover
        remove = [node for node, degree in Grafo.degree if degree < k]

        # removendo nodes
        while remove:
            Grafo.remove_nodes_from(remove)
            remove = [node for node, degree in Grafo.degree if degree < k]
        # end while

        # pegando o tamanho do subgrafo
        tam = len(max(nx.connected_components(Grafo), key=len)) if Grafo else 0
        print(tam)

        # lendo linha
        linha = input("")
    # end while
# end main


