'''
    Questao 1 - Arvore de Natal
'''


def calcula_total_de_enfeites(enfeites, peso_pacote, w):
    total = 0

    for i in range(0, len(peso_pacote)):
        # se o galho aguentar o peso, adiciona enfeites
        if i < w:
            total += enfeites[i]
        # end if
    # end for

    return total
# end calcula_total_de_enfeites()


if __name__ == '__main__':
    # lendo a quantidade de galhos da arvore
    g = int(input(""))

    for i in range(0, g):
        p = int(input(""))  # numero de pacotes
        w = int(input(""))  # capacidade de peso

        enfeites = []
        peso_pacote = []

        for j in range(0, p):
            # lendo linha
            linha = input("")

            e, pc = linha.split(" ")
            e = int(e)    # enfeites
            pc = int(pc)  # peso do pacote

            enfeites.append(e)
            peso_pacote.append(pc)
        # end for

        # calcula total de enfeites para o galho G
        total_enfeites = calcula_total_de_enfeites(enfeites, peso_pacote, w)

        print("Galho", i+1, ":")
        print("Numero total de enfeites:", total_enfeites, "\n")
    # end for
# end main
