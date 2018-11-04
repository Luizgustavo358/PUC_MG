# LAB08 - Minha Camiseta me Serve


def adiciona_no_array(tam):
    # cria array auxiliar
    result = []
    for t in range (0, len(tam)):
        tam1, tam2 = tam[t].split(" ")

        # adiciona tamanhos
        result.append(tam1)
        result.append(tam2)
    # end for
    return result
# end adiciona_no_array()


def verifica_elementos(tam):
    # cria boolean que verifica resultado
    igual = True

    # array auxiliar
    aux = []

    # adicionar tamanhos no array
    for i in range(0, len(tam)):
        if tam[i] == 'XS':
            aux[0] = 1
        elif tam[i] == 'S':
            aux[1] = 1
        elif tam[i] == 'M':
            aux[2] = 1
        elif tam[i] == 'L':
            aux[3] = 1
        elif tam[i] == 'XL':
            aux[4] = 1
        elif tam[i] == 'XXL':
            aux[5] = 1
        # end if
    # end for

    # verifica a soma dos elementos
    for i in aux:
        #
        if m > n:
            igual = False
        # end if
    # mostra o resultado
    mostra_resultado(igual)
# end verifica_elementos()


def mostra_resultado(igual):
    if igual:
        print("YES")
    else:
        print("NO")
    # end if
# end mostra_resultado()


if __name__ == '__main__':
    # lendo quantidade
    quantidade = int(input(""))

    for i in range(0, quantidade):
        # lendo n, m
        linha = input("")
        n, m = linha.split(" ")

        # convertendo para inteiro
        n = int(n)
        m = int(m)

        tam = []
        tamanho = []
        for j in range(0, m):
            # lendo tamanhos
            tam.append(input(""))
        # end for

        # da o split e adiciona
        tamanho = adiciona_no_array(tam)

        # verifica se possui elementos iguais
        verifica_elementos(tamanho)
    # end for
# end main
