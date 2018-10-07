/**
 * Trabalho 2
 *
 * @author: Luiz Gustavo Braganca dos Santos
 * Matricula: 524507
 * Professor: Saulo
 *
 * @version: 0.1
 * Data da Criação: 07/09/2017
 */

// importando dependencias
import java.util.*;

class Vertice
{
  // definindo atrubutos
  private int distancia;
  private int pesoVertice;
  public Vertice pai;

  public Vertice()
  {
    // inicia com a distancia com um numero bem grande
    this.distancia = Integer.MAX_VALUE;

    // coloca o peso do vertice igual a zero
    this.pesoVertice = 0;

    // coloca que o vertice nao tem pai
    this.pai = null;
  }// end contrutor

  public void setDistancia(int distancia)
  {
    this.distancia = distancia;
  }// end setDistancia()

  public void setPesoVertice(int pesoVertice)
  {
    this.pesoVertice = pesoVertice;
  }// end setPesoVertice()

  public void setPai(Vertice pai)
  {
    this.pai = pai;
  }// end setPai()

  public int getDistancia()
  {
    return(this.distancia);
  }// end getDistancia()

  public int getPesoVertice()
  {
    return(this.pesoVertice);
  }// end getPesoVertice()

  public Vertice getPai()
  {
    return(this.pai);
  }// end getPai()
}// end class Vertice

class Fila
{
  // definir dados
  private int[] array;
  private int prim;
  private int ult;

  /**
   * Construtor da classe.
   */
  public Fila()
  {
    this(5);
  }// end construtor

  /**
   * Construtor da classe.
   * @param  tam - tamanho da fila.
   */
  public Fila(int tam)
  {
    // adiciona o tamanho da fila
    array = new int[tam+1];

    // aponta o primeiro e ultimo pra 0
    prim = ult = 0;
  }// end contrutor

  /**
   * Metodo inserir()- insere um vertice na fila.
   * @param  v         - vertice a ser inserido.
   * @throws Exception
   */
  public void inserir(int v) throws Exception
  {
    // verifica
    if(((ult + 1) % array.length) == prim)
    {
      remover();
    }// end if

    // atribuindo ultimo valor ao passado por parametro
    array[ult] = v;

    // passando para frente a variavel ultimo
    ult = (ult + 1) % array.length;
  }// end inserir()

  /**
   * Metodo remover() - remove vertice da fila.
   * @return resp - vertice removido da fila.
   * @throws Exception - Se a fila estiver vazia.
   */
  public int remover() throws Exception
  {
    // valida remocao
    if(prim == ult)
    {
      throw new Exception("Erro ao remover!");
    }// end if

    int resp = array[prim];
    prim = (prim + 1) % array.length;

    return(resp);
  }// end remover()

  /**
   * Metodo isVazia() - verifica se a fila esta vazia.
   * @return true/false.
   */
  public boolean isVazia()
  {
    return(prim == ult);
  }// end isVazia()
}// end class Fila

class Grafo
{
  // definir dados
  private Vertice[][] grafo;
  private int tamGrafo;
  private Scanner scan = new Scanner(System.in);
  private Fila fila;
  private int[] pai;
  private int[] cor; // Cor 0 - Branco, Cor 1 - Cinza, Cor 2 - Preto

  /**
   * Metodo tipoGrafo() - verifica se e' um grafo(0)
   *                      ou se e' digrafo(1).
   * @return tipo
   */
  public int tipoGrafo()
  {
    // definir dados
    int tipo;

    // lendo linha
    tipo = scan.nextInt();

    // retornando tipo do grafo
    return(tipo);
  }// end tipoGrafo()

  /**
   * Metodo leQtdVertices() - le a quantidade de
   *                          vertices para o grafo.
   * @return vertices
   */
  public int leQtdVertices()
  {
    // definir dados
    int vertices = scan.nextInt();

    return(vertices);
  }// end leQtdVertices()

  /**
   * Metodo iniciaGrafo() - inicia grafo com zeros.
   * @param int n - tamanho do grafo.
   */
  public void iniciaGrafo(int n)
  {
    // definir dados
    int i, j;

    // pega o tamanho do grafo
    tamGrafo = n;

    // inicializando o tamanho do grafo
    grafo = new Vertice[n][n];

    // inicia a fila
    fila = new Fila(n);

    // inicia o vetor de pais
    pai = new int[n];

    // inicia o vertor de cores
    cor = new int[n];

    // inicializando o grafo com valores nulos
    for(i = 0; i < n; i++)
    {
      for(j = 0; j < n; j++)
      {
        grafo[i][j] = new Vertice();
      }// end for
    }// end for

    // inicializando cores e pais
    for(i = 0; i < n; i++)
    {
      cor[i] = 0;
      pai[i] = -1;
    }// end for
  }// end iniciaGrafo()

  /**
   * Metodo mostrar() - mostra a matriz.
   */
  public void mostrar()
  {
    // definir dados
    int i, j;

    System.out.println("\n\tMatriz " + tamGrafo + "x" + tamGrafo + "\n");

    System.out.print("___|_");

    for(i = 0; i < tamGrafo; i++)
    {
      // primeira linha da matriz
      if(i < 10)
      {
        System.out.print("0" + i + "_");
      }
      else
      {
        System.out.print(i + "_");
      }// end if
    }// end for

    System.out.println(" ");

    for(i = 0; i < tamGrafo; i++)
    {
      if(i < 10)
      {
        // mostra o vertice
        System.out.print("0" + i + " | ");
      }
      else
      {
        // mostra o vertice
        System.out.print(i + " | ");
      }

      for(j = 0; j < tamGrafo; j++)
      {
        System.out.print(" " + grafo[i][j].getPesoVertice() + " ");
      }// end for
      System.out.println(" ");
    }// end for
    System.out.println(" ");
  }// end mostrar()

  /**
   * Metodo addArestas() - le a linha e acha a origem, destino e peso
   *                       da aresta.
   * @param tipo - 0 (grafo) ou 1 (digrafo)
   */
  public void addArestas(int tipo)
  {
    // definir dados
    int origem   = 0;
    int destino  = 0;
    int peso     = 0;
    String linha = "";
    String[] grafoArray = new String[3];

    // lendo linha
    linha = scan.next();

    while(!(linha.equals("FIM")))
    {
      // quebrando a linha
      grafoArray = linha.split(",");

      // pegando a origem, destino e peso
      origem  = Integer.parseInt(grafoArray[0]);
      destino = Integer.parseInt(grafoArray[1]);
      peso    = Integer.parseInt(grafoArray[2]);

      // adicionando arestas no grafo
      addNoGrafo(origem, destino, peso);

      // lendo linha
      linha = scan.next();
    }// end while
  }// end addArestas()

  /**
   * Metodo addNoGrafo() - adiciona arestas no grafo.
   * @param int o - vertice de origem
   * @param int d - vertice de destino
   * @param int p - peso da aresta.
   */
  public void addNoGrafo(int o, int d, int p)
  {
    // adicionando na matriz
    grafo[o][d].setPesoVertice(p);
    grafo[d][o].setPesoVertice(p);
  }// end add()

  /**
   * Metodo addNoDigrafo() - adiciona aresta no digrafo.
   * @param int o - vertice de origem.
   * @param int d - vertice de destino.
   * @param int p - peso da aresta.
   */
  public void addNoDigrafo(int o, int d, int p)
  {
    // adcionando aresta
    grafo[o][d].setPesoVertice(p);
  }// end addNoDigrafo()

  /**
   * Metodo buscaEmLargura() - faz o algoritmo BFS no grafo.
   */
  public void buscaEmLargura() throws Exception
  {
    // definir dados
    int i, j;
    int contI = 0;
    int contJ = 0;

    // coloca a cor do vertice = 1 (cinza)
    cor[0] = 1;

    // adicionando o vertice 0 na fila
    fila.inserir(0);

    // busca principal
    while(!(fila.isVazia()))
    {
      // removendo da fila
      int desenfileirar = fila.remover();

      for(i = 0; i < tamGrafo; i++)
      {
        // testa se tem aresta e se tem a cor branca
        if(temAresta(desenfileirar, i) && cor[i] == 0)
        {
          // coloca a cor igual a cinza
          cor[i] = 1;

          // adiciona o pai
          pai[i] = desenfileirar;

          // adiciona vertice na fila
          fila.inserir(i);
        }// end if
      }// end for

      // coloca a cor preta no vertice
      cor[desenfileirar] = 2;
    }// end while
  }// end buscaEmLargura()

  /**
   * Metodo temAresta() - verifica se os vertices tem aresta
   *                      entre si.
   * @param  i - vertice da coluna i
   * @param  j - vertice da linha j
   * @return retorna se os vertices sao ligados entre si com
   *         true, se nao, false.
   */
  public boolean temAresta(int i, int j)
  {
    // definir dados
    boolean result = false;

    if(grafo[i][j].getPesoVertice() == 1)
    {
      result = true;
    }// end if

    return(result);
  }// end temAresta()

  /**
   * Metodo mostraCaminho() - mostra o menor caminho
   *                          do labirinto.
   */
  public void mostraCaminho()
  {
    // definir dados
    String[] resposta = new String[tamGrafo];
    int j = 0;

    for(int i = pai.length - 1; i > 0; i = pai[i])
    {
      resposta[j] = pai[i] + " --> " + i;
      j++;
    }// end for

    // adiciona na lista a resposta
    List<String> list = Arrays.asList(resposta);

    // revertendo a lista
    Collections.reverse(list);

    for(int i = 0; i < list.size(); i++)
    {
      if(list.get(i) != null)
      {
        // printando o caminho
        System.out.println(list.get(i));
      }// end if
    }// end for
  }// end mostraCaminho()
}// end class Grafo

/**
 * Classe TP2.
 */
public class TP2
{
  /**
   * Metodo main() - metodo principal.
   * @param String[] args
   */
  public static void main(String[] args) throws Exception
  {
    // definir dados
    Grafo grafo  = new Grafo();
    int tipo     = grafo.tipoGrafo();
    int vertices = grafo.leQtdVertices();

    // inciando o grafo com zeros
    grafo.iniciaGrafo(vertices);

    // adicionando arestas
    grafo.addArestas(tipo);

    // fazendo a busca em largura
    grafo.buscaEmLargura();

    // mostrando o menor caminho
    grafo.mostraCaminho();
  }// end main()
}// end class TP2