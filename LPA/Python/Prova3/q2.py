'''
    Questao 2 - Pontes de Sao Petersburgo
'''

import networkx as nx


def testa_regioes(G, k, r):
    result = False
    cont = 0

    for j in range(0, r):
        for l in range(1, r):
            if G.has_edge(j, l):
                # conta quantos edges possui o grafo
                cont += verifica_edges(G, j, l)
            # end if
        # end for
    # end for

    # testa se possui o mesmo numero de pontes
    if cont == k:
        result = True
    # end if

    # mostra a resposta
    resposta(result)
# end testa_regioes()


def verifica_edges(G, a, b):
    # verifica se a regiao A e' diferente de B
    if a != b:
        result = G.number_of_edges(a, b)
    else:
        result = 0
    # end if

    return result
# end verifica_edges()


def resposta(resp):
    # possui k pontes
    if resp:
        print("S")
    else:
        print("N")
    # end if
# end resposta()


if __name__ == '__main__':
    # le a linha
    linha = input("")

    while linha != "":
        # da um split
        r, k = linha.split(" ")
        r = int(r)  # numero de regioes
        k = int(k)  # pontes das cidades

        # instancia o grafo
        G = nx.Graph()

        for i in range(0, k):
            # lendo A e B
            linha = input("")

            a, b = linha.split(" ")
            a = int(a)  # regiao A
            b = int(b)  # regiao B

            # adicionando no's
            G.add_node(a)
            G.add_node(b)

            # adicionando aresta
            G.add_edge(a, b)
        # end for

        # testa regioes se possuem k pontes
        testa_regioes(G, k, r)

        linha = input("")
    # end while
# end main
