# DFS — Algoritmo de Búsqueda en Profundidad

Este programa implementa el algoritmo Depth-First Search (DFS) utilizando una matriz de adyacencia como representación del grafo.

## Descripción general

### Entrada
El programa pregunta si quieres ingresar la matriz manualmente o prefieres usar los archivos csv el cual debe contener en la primera fila el numero de nodos, en la segunda fila el vertice inicial y por ultimo la matriz fila a fila (cada dato separado por comas), ejemplo:
```bash
5
0
0,1,0,0,0
1,0,0,0,0
0,0,0,0,1
0,0,1,0,0
0,0,0,1,0
```
El programa solicita al usuario la matriz de adyacencia del grafo principal.

### Estructuras internas
Se crea un arreglo (vector o lista) para manejar el estado de cada nodo con la siguiente codificación:

-1 → No visitado

0 → En proceso

+1 → Visitado

El número del nodo corresponde directamente a su posición en el arreglo (por ejemplo, el nodo 1 se consulta en la posición 1).

### Parámetro de ejecución
El programa solicita el vértice inicial desde donde comenzará la búsqueda en profundidad.

### Resultados esperados

Lista de vértices alcanzados, por ejemplo:
{c, a, b, d}

Lista de aristas recorridas durante la búsqueda, por ejemplo:
{(c, a), (a, b), (a, d), (a, c)}

### Comportamiento de la pila
Durante la ejecución, la pila se llena al máximo posible mientras el algoritmo profundiza; luego, en la etapa de retroceso (backtracking), la pila se vacía siguiendo la lógica natural del DFS.

## Ejecución
### Cómo obtener e instalar SBCL

SBCL (Steel Bank Common Lisp) es uno de los compiladores e intérpretes de Common Lisp más usados. Puedes instalarlo fácilmente según tu sistema operativo.

### Linux (Ubuntu / Debian)
La forma más sencilla es instalarlo desde los repositorios oficiales:
```bash
sudo apt update
sudo apt install sbcl
```

### Windows

1. [Ve al sitio oficial](https://www.sbcl.org/platform-table.html)
2. Descarga el instalador para Windows (.msi).
3. Ejecuta el instalador

### Ejecutar
Asegúrate de tener SBCL instalado. Para ejecutar el programa desde el mismo directorio, usa el siguiente comando en la terminal:
```bash
sbcl --script main.lisp
```

