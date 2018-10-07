import networkx as nx


''' 
    Main
    N = numero total de empresas clientes
    P = total de pares
    K =  
'''
if __name__ == '__main__':
    # lendo linha
    linha = input("")

    while linha != "0 0 0":
        # pegando cada variavel
        n, p, k = linha.split(" ")

        # converte
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

        # listando arestas
        a = Grafo.nodes()
        print(a)
        # remocao de nodes
        for i in range(1, n):
            # se node possui um numero menor do que K, remove
            # if(Grafo.adjacency(i)):
                Grafo.remove_node(i)
            # end if
        # end for

        # lendo linha
        linha = input("")
    # end while



    # tam = max(nx.connected_component_subgraphs(Grafo), key=len)
# end main


