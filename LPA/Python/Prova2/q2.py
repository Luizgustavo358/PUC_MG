import networkx as nx


if __name__ == '__main__':
    # le o inteiro n = numero de alunos
    n = int(input(""))

    # verifica se nao ha' alunos
    while n != 0:
        # instancia o grafo
        G = nx.Graph()

        # lendo amizades
        for i in range(0, n):
            # m = aluno
            m = int(input(""))

            # adiciona aluno no grafo
            G.add_node(m)

            # le a amizade
            amizade = input("")

            # pega os alunos x, y que o aluno m tem amizade
            x, y = amizade.split(" ")

            # converte para int
            x = int(x)
            y = int(y)

            # adiciona amizade no grafo
            G.add_edge(m, x)
            G.add_edge(m, y)
        # end for

        # cria as salas
        sala1 = []
        sala2 = []

        for i in range(1, n):
            # verifica se possui amizade
            if G.has_edge(i, i+1):
                # remove amizade
                G.remove_edge(i, i+1)

                # coloca amigos em salas diferentes
                sala1.append(i)
                sala2.append(i+1)
            # end if
        # end for

        n = int(input(""))
    # end while
# end main
