import matplotlib.pyplot as plt # grafico
import sys

# pega o tempo no padrao do comando "time" do linux
# e o transforma para segundos, sabendo que o programa
# nao vai executar em mais de 59 minutos
def getSegundos( time ):
    splited = time.split("m")

    minutos = float( splited[0] )
    segundos = float( splited[1].replace( "s", "" ))

    return minutos*60 + segundos

#fim metodo getSegundos


def lerDados( path ):
    # abre o arquivo para leitura
    with open( path ) as openfileobject:

        # lista de tempos
        tempos = list()

        # numero de cidades de um certo tempo
        numCidades = 3

        # esse numero ajuda a pegar somente o tempo real
        # de execucao
        num = 0
        # lista com os tempos de execucao
        tempo = list()

        # enquanto existe linha no arquivo
        for line in openfileobject:
            if num == 3:
                # vou querer so o tempo de execucao do algoritimo
                splited = line.replace("\n","").split("\t")

                # transforma o tempo em segundos (float)
                segundos = getSegundos( splited[1] )

                #print(segundos)
                #tempos.append( [ int (numCidades), float ( segundos ) ] )
                tempos.append(float(segundos))

                numCidades += 1
            #fim if
            num = (num + 1)%6
        # fim for
    #fim with

    return tempos
#fim da funcao lerDados


def main():
    #tempoGenetico = lerDados("Genetico.txt")
    tempoBruta = lerDados("forca-bruta.txt")
    #tempoBranch = lerDados("BranchAndBounds.txt")
    #tempoDinamica = lerDados("ProgramacaoDinamica.txt")

    # numero de vertices
    lista_vertices = list()

    # numero de vertices do grafo
    for x in range(3, 13):
        lista_vertices.append( x )
    # end for

    #plt.plot(lista_vertices, tempoGenetico)
    plt.plot(lista_vertices, tempoBruta)
    #plt.plot(lista_vertices, tempoBranch)
    #plt.plot(lista_vertices, tempoDinamica)

    plt.xlabel('Número de cidades')
    plt.ylabel('Tempo em segundos')

    plt.title('Gráfico do tempo de execução dos algorítimos')
    plt.legend(['Algorítimo Genético','Força Bruta','Branch and Bounds', 'Programaçao Dinamica'], loc='upper left')

    plt.show()

    #print( tempoGenetico )
    #print( tempoBruta )
    #print( tempoBranch )
#fim main

# Executa o main
main()
