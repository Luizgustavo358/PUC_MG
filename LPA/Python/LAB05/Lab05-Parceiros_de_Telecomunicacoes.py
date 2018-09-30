import networkx as nx


def le_linha():
    str = input("")
    return str
# end leLinha()


''' 
    Main
    N = numero total de empresas clientes
    P = total de pares
    K =  
'''
if __name__ == '__main__':
    # lendo linha
    str = le_linha()

    while str != "0 0 0":
        # pegando cada variavel
        n, p, k = str.split(" ")

        # declara o grafo
        Grafo = nx.Graph()

        for i in range(1, p):
            # le conjunto
            conjunto = le_linha()

            # da o split
            a, b = conjunto.split(" ")

            # transforma em inteiro
            a = int(a)
            b = int(b)

            # adiciona no grafo
            Grafo.add_edge(a, b)
        # end for

        # remocao de nodes
        for i in range(1, n):
            # se node possui um numero menor do que K, remove
            # if(Grafo.adjacency(i)):
                Grafo.remove_node(i)
            # end if
        #

        # lendo linha
        str = le_linha()
    # end while



    # tam = max(nx.connected_component_subgraphs(Grafo), key=len)
# end main