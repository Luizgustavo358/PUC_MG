/**
 * Trabalho 1
 *
 * @author: Luiz Gustavo Braganca dos Santos
 * Matricula: 524507
 * Professor: Saulo
 *
 * @version: 0.1
 * Data da Criação: 17/08/2017
 */

// importando dependencias
import java.io.*;
import java.*;
import java.nio.charset.*;
import java.util.Scanner;

 class MyIO
 {
    private static BufferedReader in = new BufferedReader(new InputStreamReader(System.in, Charset.forName("ISO-8859-1")));
    private static String charset = "ISO-8859-1";

    public static void setCharset(String charset_){
       charset = charset_;
       in = new BufferedReader(new InputStreamReader(System.in, Charset.forName(charset)));
    }

    public static void print(){
    }

    public static void print(int x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void print(double x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void print(String x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void print(boolean x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void println(){
    }

    public static void println(int x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.println(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void println(double x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.println(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void println(String x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.println(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void println(boolean x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.println(x);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static void printf(String formato, double x){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.printf(formato, x);// "%.2f"
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
    }

    public static double readDouble(){
       double d = -1;
       try{
          d = Double.parseDouble(readString().trim().replace(",","."));
       }catch(Exception e){}
       return d;
    }

    public static double readDouble(String str){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(str);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
       return readDouble();
    }

    public static float readFloat(){
       return (float) readDouble();
    }

    public static float readFloat(String str){
       return (float) readDouble(str);
    }

    public static int readInt(){
       int i = -1;
       try{
          i = Integer.parseInt(readString().trim());
       }catch(Exception e){}
       return i;
    }

    public static int readInt(String str){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(str);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
       return readInt();
    }

    public static String readString(){
       String s = "";
       char tmp;
       try{
          do{
             tmp = (char)in.read();
             if(tmp != '\n' && tmp != ' ' && tmp != 13){
                s += tmp;
             }
          }while(tmp != '\n' && tmp != ' ');
       }catch(IOException ioe){
          System.out.println("lerPalavra: " + ioe.getMessage());
       }
       return s;
    }

    public static String readString(String str){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(str);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
       return readString();
    }

    public static String readLine(){
       String s = "";
       char tmp;
       try{
          do{
             tmp = (char)in.read();
             if(tmp != '\n' && tmp != 13){
                s += tmp;
             }
          }while(tmp != '\n');
       }catch(IOException ioe){
          System.out.println("lerPalavra: " + ioe.getMessage());
       }
       return s;
    }

    public static String readLine(String str){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(str);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
       return readLine();
    }

    public static char readChar(){
       char resp = ' ';
       try{
          resp  = (char)in.read();
       }catch(Exception e){}
       return resp;
    }

    public static char readChar(String str){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(str);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
       return readChar();
    }

    public static boolean readBoolean(){
       boolean resp = false;
       String str = "";

       try{
          str = readString();
       }catch(Exception e){}

       if(str.equals("true") || str.equals("TRUE") || str.equals("t") || str.equals("1") ||
             str.equals("verdadeiro") || str.equals("VERDADEIRO") || str.equals("V")){
          resp = true;
             }

       return resp;
    }

    public static boolean readBoolean(String str){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(str);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
       return readBoolean();
    }

    public static void pause(){
       try{
          in.read();
       }catch(Exception e){}
    }

    public static void pause(String str){
       try {
          PrintStream out = new PrintStream(System.out, true, charset);
          out.print(str);
       }catch(UnsupportedEncodingException e){ System.out.println("Erro: charset invalido"); }
       pause();
    }
 }

/**
 * Classe Trabalho1.
 */
public class Trabalho1
{
  // definir dados
  private static int[][] grafo;
  private static int tamanhoGrafo;
  private static Scanner scan = new Scanner(System.in);

  /**
   * Metodo tipoGrafo() - verifica se e' um grafo(0)
   *                      ou se e' digrafo(1).
   * @return tipo
   */
  public static int tipoGrafo()
  {
    // definir dados
    int tipo;

    // lendo linha
    tipo = scan.nextInt(); //MyIO.readInt();

    // retornando tipo do grafo
    return(tipo);
  }// end tipoGrafo()

  /**
   * Metodo leQtdVertices() - le a quantidade de
   *                          vertices para o grafo.
   * @return vertices
   */
  public static int leQtdVertices()
  {
    // definir dados
    int vertices = scan.nextInt(); //MyIO.readInt();

    return(vertices);
  }// end leQtdVertices()

  /**
   * Metodo iniciaGrafo() - inicia grafo com zeros.
   * @param int n - tamanho do grafo.
   */
  public static void iniciaGrafo(int n)
  {
    // definir dados
    int i, j;

    tamanhoGrafo = n;

    // inicializando o tamanho do grafo
    grafo = new int[n][n];

    // inicializando o grafo com valores nulos
    for(i = 0; i < n; i++)
    {
        for(j = 0; j < n; j++)
        {
          grafo[i][j] = 0;
        }// end for
    }// end for
  }// end iniciaGrafo()

  /**
   * Metodo mostrar() - mostra a matriz.
   */
  public static void mostrar()
  {
    // definir dados
    int i, j;

    for(i = 0; i < tamanhoGrafo; i++)
    {
      for(j = 0; j < tamanhoGrafo; j++)
      {
        MyIO.print(grafo[i][j] + " ");
      }// end for
      MyIO.println(" ");
    }// end for
  }// end mostrar()

  /**
   * Metodo addArestas() - le a linha e acha a origem, destino e peso
   *                       da aresta.
   */
  public static void addArestas(int tipo)
  {
    // definir dados
    int origem   = 0;
    int destino  = 0;
    int peso     = 0;
    String linha = "";

    // lendo linha
    linha = scan.next(); //MyIO.readLine();

    while(!(linha.equals("FIM")))
    {
      // pegando a origem, destino e peso
      origem  = Integer.parseInt(linha.substring(0, 1));
      destino = Integer.parseInt(linha.substring(2, 3));
      peso    = Integer.parseInt(linha.substring(4, 5));

      if(tipo == 0)
      {
        // adicionando arestas no grafo
        addNoGrafo(origem, destino, peso);
      } else if(tipo == 1){
        // adicionando arestas no digrafo
        addNoDigrafo(origem, destino, peso);
      }// end if

      // lendo linha
      linha = scan.next();//MyIO.readLine();
    }// end while
  }// end addArestas()

  /**
   * Metodo addNoGrafo() - adiciona arestas no grafo.
   * @param int o - vertice de origem
   * @param int d - vertice de destino
   * @param int p - peso da aresta.
   */
  public static void addNoGrafo(int o, int d, int p)
  {
    // adicionando na matriz
    grafo[o][d] = p;
    grafo[d][o] = p;
  }// end add()

  /**
   * Metodo addNoDigrafo() - adiciona aresta no digrafo.
   * @param int o - vertice de origem.
   * @param int d - vertice de destino.
   * @param int p - peso da aresta.
   */
  public static void addNoDigrafo(int o, int d, int p)
  {
    // adcionando aresta
    grafo[o][d] = p;
  }// end addNoDigrafo()

  /**
   * Metodo verificaGrau() - verifica o grau do vertice.
   * @param int t - tipo do grafo.
   */
  public static void verificaGrau(int t)
  {
    // definir dados
    int i;
    int cont = 0;
    int vertice = scan.nextInt();//MyIO.readInt();

    if(t == 0)
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        if(grafo[vertice][i] != 0 && vertice > i)
        {
          cont++;
        }// end if
      }// end for
    }
    else if(t == 1)
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        if(grafo[vertice][i] != 0 && grafo[i][vertice] != 0)
        {
          cont++;
        }// end if
      }// end for
    }// end if

    MyIO.println(cont);
  }// end verificaGrau()

  /**
   * Metodo verificaAresta() - verifica a existencia de uma aresta.
   */
  public static void verificaAresta()
  {
    // definir dados
    String aresta = scan.next();//MyIO.readLine(); // le aresta
    int origem = Integer.parseInt(aresta.substring(0, 1)); // pega origem
    int destino = Integer.parseInt(aresta.substring(2, 3)); // pega destino
    boolean result = false;

    // verifica se tem aresta entre os vertices
    if(grafo[origem][destino] != 0)
    {
      result = true;
    }// end if

    // mostra se tem aresta
    temAresta(result);
  }// end verificaAresta()

  /**
   * Metodo temAresta() - mostra na tela se existe aresta entre vertices.
   * @param boolean tem - true/false se tiver vertices.
   */
  public static void temAresta(boolean tem)
  {
    if(tem)
    {
      MyIO.println("SIM");
    }
    else
    {
      MyIO.println("NAO");
    }// end if
  }// end temAresta()

  /**
   * Metodo totalArestas() - mostra quantas arestas o grafo possui.
   * @param int t - tipo do grafo.
   */
  public static void totalArestas(int t)
  {
    // definir dados
    int i, j;
    int cont = 0;

    if(t == 0) // grafo
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        for(j = 0; j < tamanhoGrafo; j++)
        {
          if(j > i && grafo[i][j] != 0)
          {
            cont++;
          }// end if
        }// end for
      }// end for
    }
    else if(t == 1) // digrafo
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        for(j = 0; j < tamanhoGrafo; j++)
        {
          if(grafo[i][j] != 0)
          {
            cont++;
          }// end if
        }// end for
      }// end for
    }// end if

    MyIO.println(cont);
  }// end totalArestas()

  /**
   * Metodo grafoCompleto() - verifica se o grafo e' completo.
   * @param int t - tipo do grafo.
   */
  public static void grafoCompleto(int t)
  {
    // definir dados
    int i, j;
    int cont = 0;

    if(t == 0) // grafo
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        for(j = 0; j < tamanhoGrafo; j++)
        {
          if(j > i && grafo[i][j] != 0) // acima da diagonal principal
          {
            cont++;
          }// end if
        }// end for
      }// end for
    }
    else if(t == 1) // digrafo
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        for(j = 0; j < tamanhoGrafo; j++)
        {
          if(grafo[i][j] != 0)
          {
            cont++;
          }// end if
        }// end for
      }// end for
    }// end if

    // printando se e' um grafo completo
    printGrafoCompleto(cont);
  }// end grafoCompleto()

  /**
   * Metodo printGrafoCompleto() - escreve se o grafo esta completo ou nao.
   * @param int c - quantidade de arestas do grafo.
   */
  public static void printGrafoCompleto(int c)
  {
    if(c == grafo.length)
    {
      MyIO.println("SIM");
    }
    else
    {
      MyIO.println("NAO");
    }// end if
  }// end printGrafoCompleto()

  /**
   * Metodo grafoComplementar() - mostra o grafo complementar.
   * @param int tipo - tipo do grafo.
   */
  public static void grafoComplementar(int tipo)
  {
    // definir dados
    int i, j;

    if(tipo == 0) // grafo
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        for(j = 0; j < tamanhoGrafo; j++)
        {
          if(j > i && grafo[i][j] == 0)
          {
            MyIO.println(i + "," + j + "," + 1);
          }// end if
        }// end for
      }// end for
    }
    else if(tipo == 1) // digrafo
    {
      for(i = 0; i < tamanhoGrafo; i++)
      {
        for(j = 0; j < tamanhoGrafo; j++)
        {
          if(grafo[i][j] == 0)
          {
            MyIO.println(i + "," + j + "," + grafo[i][j]);
          }// end if
        }// end for
      }// end for
    }// end if
  }// end grafoComplementar()

  /**
   * Metodo Main.
   */
  public static void main(String[] args)
  {
    // definir dados
    int tipo = tipoGrafo();
    int totalVertices = leQtdVertices();

    // zerando grafo
    iniciaGrafo(totalVertices);

    // verifica se e' grafo ou digrafo
    if(tipo == 0)
    {
      // grafo
      addArestas(tipo);

      // verificando o grau
      verificaGrau(tipo);

      // verificando exis da aresta
      verificaAresta();

      // verifica o total de arestas
      totalArestas(tipo);

      // verifica se e' um grafo completo
      grafoCompleto(tipo);

      // mostrando arestas do grafo complementar
      grafoComplementar(tipo);
    }
    else if(tipo == 1)
    {
      // digrafo
      addArestas(tipo);

      // verificando o grau
      verificaGrau(tipo);

      // verificando exis da aresta
      verificaAresta();

      // verifica o total de arestas
      totalArestas(tipo);

      // verifica se e' um digrafo completo
      grafoCompleto(tipo);

      // mostrando arestas do grafo complementar
      grafoComplementar(tipo);
    }// end if
  }// end main
}// end class
