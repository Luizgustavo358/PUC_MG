import networkx as nx
import matplotlib.pyplot as plt


def mostra(grafo):
    nx.draw(grafo)
    plt.show()
# end mostra()


def transforma_em_string(linha):
    result = str(linha)
    
    return result
# end transforma_em_int()


def transforma_em_int(linha):
    result = transforma_em_string(linha)

    result = int(result[11:13])

    return result
# end transforma_em_int()


if __name__ == '__main__':
    # lendo
    linha = input("")

    # le a linha ate ser diferente de "0 0 0"
    while linha != "0 0 0":
        n, m, t = linha.split(" ")

        # converte para inteiro
        n = int(n)  # n = numero de cidades
        m = int(m)  # m = numero de estradas
        t = int(t)  # t = capacidade do carro

        # instancia o grafo
        G = nx.Graph()

        for i in range(0, m):
            linha = input("")

            a, b, c = linha.split(" ")

            # convertendo para inteiro
            a = int(a)  # a = cidade A
            b = int(b)  # b = cidade B
            c = int(c)  # c = consumo de gasolina

            # adicionando vertices
            G.add_node(a)
            G.add_node(b)

            # adicionando as rotas
            G.add_edge(a, b, weight=c)
        # end for

        # cria um array para os custos
        # da gasolina das cidades
        custo = []

        # lendo o custo de cada vertice
        for i in range(0, n):
            # adicionando custo de cada cidade
            custo.append(int(input("")))
        # end for

        # carro do Max, esta na primeira cidade
        carro = 1

        # declara o menor custo possivel
        menorCusto = 0

        # visitando as cidades
        for i in range(1, n):
            # verifica se tem aresta e gasolina para ir
            if G.has_edge(i, i+1) and t >= transforma_em_int(G.get_edge_data(i, i+1)):
                # vai para a proxima cidade
                carro = carro + 1

                # decrementa a gasolina
                t = t - transforma_em_int(G.get_edge_data(i, i+1))
            elif G.has_edge(i, i+1) and t < transforma_em_int(G.get_edge_data(i, i+1)):
                # olha quanto de gasolina precisa para ir para a proxima cidade
                gasolinaParaAdicionar = t - transforma_em_int(G.get_edge_data(i, i+1)) * custo[i]

                # adiciona gasolina para ir para outra cidade
                menorCusto = t + gasolinaParaAdicionar

                # vai para a proxima cidade
                carro = carro + 1

                # decrementa a gasolina
                t = t - transforma_em_int(G.get_edge_data(i, i+1))
            # end if
        # end for

        # verifica se o carro passou em todas cidades
        if carro == n:
            print(menorCusto)
        else:
            print("-1")
        # end if

        linha = input("")
    # end while
# end main
