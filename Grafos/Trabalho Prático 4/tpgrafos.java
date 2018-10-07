/**
 * TP4 - Algoritmos em Grafos
 *
 * Problema:A empresa deseja saber o número mínimo de horas
 * que serão necessárias para que todas as tarefas sejam executadas.
 *
 * Solução : Coloração de Vértices (baseado no algoritmo naive)
 *
 * @author: Isabelle Langkammer
 * @author: Luiz Gustavo Bragança
 * 
 *
 * 2/2017
 */

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

class Grafo {

	public ArrayList<Vertice> listVertice;
	private ArrayList<Integer> listCores;
	public int num;

	public Grafo(int num) {

		listVertice = new ArrayList<>();
		listCores = new ArrayList<>();
		this.num = num;

	}

	/**
	 * Método que adiciona o vértice a lista de vértices
	 */
	public void add(Vertice vertice) {

		listVertice.add(vertice);

	}

	/**
	 * Método que atribui cores aos vértices
	 */
	public void coloracaoNaive() {

		int i = 0;
		int k = 0;

		//atribuir cor i ao primeiro vértice.
		listCores.add(k);
		listVertice.get(i).setCor(k);

		//percorrer sequencialmente os vértices restantes
		for(int a = 1; a < num; a++) {

			Vertice vertice = listVertice.get(a);

			//k=-1 para fazer uma nova comparação de cor com k
			k = -1;
			// comparar a cor dos vértices adjacentes com a lista de cores
			for(Integer cor : this.listCores) {

                if(!vertice.verificaCor(cor)) {

                    k = cor;
                    break;

                }

            }
			
			if(k == -1) {
				//Se os vértices adjacentes já usam todas as cores,
				//então i = i+1
				//e k = i
	      		//atribuir cor i ao vértice v
				i = i + 1;
				k = i;
				listCores.add(k);
            }

			//k = primeira cor já utilizada e que não pertence a nenhum dos vértices adjacentes a v
			//atribuir cor k a v
            vertice.setCor(k);

		}

		System.out.println(i);


	}

}

class Vertice {

	private int cor;
	private ArrayList<Vertice> listAdjacencia;

	public Vertice() {

		listAdjacencia = new ArrayList<>();

	}

	/*
	 * Método que seta a cor;
	 */
	public void setCor(int cor) {

		this.cor = cor;

	}

	/*
	 * Método que retorna a cor
	 */
	public int getCor() {

		return this.cor;

	}

	/*
	 * Método que adiciona o vértice a lista de adjacência
	 */
	public void addList(Vertice vertice) {

		listAdjacencia.add(vertice);

	}

	/**
	 * Método que verifica as cores dos vertices adjacentes com a lista de cores
	 */
	public boolean verificaCor(int cor) {

        for(Vertice vertice : this.listAdjacencia) {

            if(vertice.getCor() == cor) {

                return true;

            }

        }

        return false;
    }

}

class tpgrafos {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);

		int num = Integer.parseInt(scanner.nextLine());
		Grafo grafo = new Grafo(num);

		for(int i = 0; i < num; i++) {

			grafo.add(new Vertice());

		}

		//Preenche o Grafo

		ArrayList<Vertice> vertice = grafo.listVertice;
		String line = scanner.nextLine();
		while (!line.equals("FIM")) {

			String[] tmp = line.split(",");
			int origem = Integer.parseInt(tmp[0]);
			int destino = Integer.parseInt(tmp[1]);

			vertice.get(origem).addList(vertice.get(destino));
			vertice.get(destino).addList(vertice.get(origem));


			line = scanner.nextLine();

		}

		//chama o método de coloração de vértices
		grafo.coloracaoNaive();


	}

}
