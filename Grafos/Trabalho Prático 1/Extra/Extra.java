/**
 * Trabalho Extra
 *
 * @author: Luiz Gustavo Braganca dos Santos
 * Matricula: 524507
 * Professor: Saulo
 *
 * @version: 0.1
 * Data da Criação: 22/08/2017
 */

// importando dependencias
import java.util.Scanner;

class Materias
{
  // definir dados
  private String nomeMateria;
  private String[] requisito;

  public Materias()
  {
    nomeMateria = "";
    requisito = null;
  }

  public Materias(String nome, String[] requisito)
  {
    this.nomeMateria = nome;
    this.requisito = requisito;
  }

  public void setNome(String nome)
  {
    this.nomeMateria = nome;
  }

  public String getNome()
  {
    return(this.nomeMateria);
  }

  public void ler()
  {
    
  }
}// end class Materias

class Vertice
{
  // definir dados
  public Materias materia;
  public Vertice prox;

  public Vertice()
  {
    this(null);
  }// end contrutor

  public Vertice(Materias materia)
  {
    this.materia = materia;
    this.prox = null;
  }// end contrutor
}// end class Vertice

class Lista extends Materias
{
  // definir dados
  public Vertice pri;
  public Vertice ult;

  public Lista()
  {
    pri = new Vertice();

    ult = pri;
  }

  public void inserir(Materias materia)
  {
    ult.prox = new Vertice(materia);

    ult = ult.prox;
  }// end inserir()
}// end class Lista

public class Extra
{
  public static void main(String[] args) throws Exception
  {
    // definir dados
    Scanner scan = new Scanner(System.in);
    Lista lista = new Lista();
    Materias materias;
    String str;

    str = scan.next();

    while(!(str.equals("")))
    {
      materias = new Materias();

      materias.ler(str);

      lista.inserir(materias);

      str = scan.next();
    }// end while
  }// end main
}// end class Extra
