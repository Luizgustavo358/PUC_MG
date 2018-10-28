# LAB06-Bicicletas - arvore geradora minima
import networkx as nx


def le_linha():
    linha = input("")

    return linha
# end le_linha()


def transforma_em_string(linha):
    result = str(linha)

    return result
# end transforma_em_int()


def transforma_em_int(linha):
    result = transforma_em_string(linha)

    result = int(result[11:12])

    return result
# end transforma_em_int()


def maior_caminho(caminho, grafo):
    # pega a primeira aresta
    o = int(caminho[0])
    d = int(caminho[1])

    # pega peso
    peso = grafo.get_edge_data(o, d)

    maior = transforma_em_int(peso)

    for i in range(1, len(caminho)-1):
        o = int(caminho[i])
        d = int(caminho[i+1])

        peso = grafo.get_edge_data(o, d)

        # testa se o peso e' maior
        if transforma_em_int(peso) > maior:
            maior = transforma_em_int(peso)
        # end if
    # end for

    return maior
# end maior_caminho()


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
            linha = input("")

            # dando o split
            u, v, w = linha.split(" ")

            G.add_edge(int(u), int(v), weigth=int(w))
            G.add_edge(int(v), int(u), weigth=int(w))
        # end for

        # k = numero de pares
        k = le_linha()

        k = int(k)

        for i in range(0, k):
            # lendo pares
            linha = le_linha()

            # separando por espaco
            origem, destino = linha.split(" ")

            # converte para inteiro
            origem = int(origem)
            destino = int(destino)

            # mostrando as maiores alturas encontradas
            print("Instancia", h)

            caminho = nx.shortest_path(G, source=origem, target=destino)

            # pega maior peso
            caminho = maior_caminho(caminho, G)

            print(caminho)

            # incrementa a instancia
            h = h + 1
        # end for

        # lendo linha
        linha = le_linha()
    # end while
# end main
