# maximizar_moedas()
def maximizar_moedas(moedas):
    resp = 0
    somatorio = 0

    for moeda in moedas:
        if moedas.index(moeda) == (len(moedas)-1) or somatorio + moeda < moedas[moedas.index(moeda)+1]:
            somatorio += moeda
            resp += 1
        # end if
    # end for
    return resp
# end maximizar_moedas()


if __name__ == '__main__':
    # cria array de moedas
    moedas = []

    # lendo os casos de testes
    t = int(input(""))

    for i in range(0, t):
        # desconsidera proxima linha
        input()

        # le moedas
        moedas = [int(moeda) for moeda in input().split()]

        print(maximizar_moedas(moedas))
    # end for
# end main
