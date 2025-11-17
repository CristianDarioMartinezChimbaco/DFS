# DFS
Algoritmo de busqueda profunda DFS

Se solicita Matriz de adyacencia del grafo principal 

Entonces suponiendo que en el programa ingreso la matriz adyacente de un grafo, crea un arreglo, lista o vector en donde dado el nodo (con números, ej nodo numero 1, entonce busco directamente en la posiciona 1 del arreglo) averiguo si esta en -1, 0 u +1 (No visitado, en proceso, visitado)

Solicita vertice inicial

Da como resultado lista de vertices que se alcanzan = {c,a,b,d} y lista de aristas {(c, a), (a, b), (a, d), (a, c) }

La pila se llena lo maximo posible subiendo y vajando de nivel para despues baciarla
Para compilar en el mismo directorio ejecutar en la terminal "sbcl --script main.lisp" con lisp sbcl previamente adquirido 
