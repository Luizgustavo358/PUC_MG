import networkx as nx

if __name__ == "__main__":
    str = input("")
    n, m = str.split(" ")

    n = int(n)
    m = int(m)

    G = nx.Graph()

    for i in range(0, m):
        str = input("")
        u, v, w = str.split(" ")
        G.add_edge(int(u), int(v), weight=int(w))

    print(G.edges.data('weight'))

    T = nx.minimum_spanning_tree(G)
    print(T.edges.data('weight'))

    new_graph = nx.difference(G, T)
    print(new_graph.edges.data('weight'))
# end main