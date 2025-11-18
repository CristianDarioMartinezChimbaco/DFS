(format t "******************************~%")
(format t "*  DDDDD   FFFFFFF   SSSSS   *~%")
(format t "*  D    D  F        S     S  *~%")
(format t "*  D     D F        S        *~%")
(format t "*  D     D FFFFF     SSSSS   *~%")
(format t "*  D     D F              S  *~%")
(format t "*  D    D  F        S     S  *~%")
(format t "*  DDDDD   F         SSSSS   *~%")
(format t "******************************~%")

(defparameter *adyacencia_matriz* (make-array '(30 30) :initial-element 0))
;(defparameter *acceso_matriz* (make-array '(30 30) :initial-element 0))
(defparameter *vector_estados* (make-array 30 :initial-element -1)) ;{-1, -1, -1, -1, -1} 

(defparameter *numero_vertices* 0) 
(defparameter *vertice_inicial* 0)

(defparameter *lista_vertices_alcanzables* '()) ;()
(defparameter *lista_aristas* '()) ;({})
(defparameter *pila* '())

(defparameter *opcion* 0)

(defun main()
    (format t "Hola, este es un programa para uasar DFS ~%")
    (format t "Ingrese [0] leer CSV o [1] manualmente ~%")
    (setf *opcion* (read))
    (case *opcion*
        (0
            (leer_archivo)
        )
        (1
            (definir_numero_vertices)
            (insertar_matriz_adyacencia)
            (definir_vertice_inicial)
        )
        (otherwise
            (format t "Valor invalido ~%")
            (main)
        )

    )
    (push *vertice_inicial* *pila*) ;Agrega a la pila el nodo inicial
    (setf (aref *vector_estados* *vertice_inicial*) 0) ;Modifica el estado del nodo inicial a descubierto o 0 del vector de estados en
    (setf *lista_vertices_alcanzables* (append *lista_vertices_alcanzables* (list *vertice_inicial*))) ;Agrgar a la lista de nodos alcanzables el nodo inicial
    (format t "Pila = ~a ~%" *pila*)
    (format t "el estado del nodo inicial = ~a ~%" (aref *vector_estados* *vertice_inicial*))
    (format t "Lista de nodos alcanzables = ~a ~%" *lista_vertices_alcanzables*)
    (dfs (car *pila*))
    (format t "********RESULTADO********~%")
    (imprimir_vector_estados)
    (format t "el estado del nodo inicial = ~a ~%" (aref *vector_estados* *vertice_inicial*))
    (format t "Lista de nodos alcanzables = ~a ~%" *lista_vertices_alcanzables*)
    ;(format t "Lista de aristas = ~a ~%" *lista_aristas*)
    (imprimir_lista_aristas)
)

(defun leer_archivo ()
    (let ((contador_filas 0) (contador_columnas 0)) ;para indicar la fila del archivo
        (with-open-file (stream "adyacencia_matriz.csv" :direction :input)
            (loop for linea = (read-line stream nil) while linea do
                (format t "Leí: ~a~%" linea)
                (loop for j from 0 below (length linea) do
                    (if (= contador_filas 0)
                        (setf *numero_vertices* (digit-char-p (aref linea j)))
                    )
                    (if (= contador_filas 1)
                        (setf *vertice_inicial* (digit-char-p (aref linea j)))
                    )
                    (when (and (char= (aref linea j) #\1) (>= contador_filas 2))
                        (setf (aref *adyacencia_matriz* (- contador_filas 2) contador_columnas) 1)
                        ;(format t "Matriz de adyacencia ~a en ~a,~a ~%" (aref *adyacencia_matriz* (- contador_filas 2) contador_columnas) (- contador_filas 2) contador_columnas)
                        (incf contador_columnas)
                    )
                    (when (and (char= (aref linea j) #\0) (>= contador_filas 2))
                        (setf (aref *adyacencia_matriz* (- contador_filas 2) contador_columnas) 0)
                        ;(format t "Matriz de adyacencia ~a en ~a,~a ~%" (aref *adyacencia_matriz* (- contador_filas 2) contador_columnas) (- contador_filas 2) contador_columnas)
                        (incf contador_columnas)
                    )
                )
                (setq contador_columnas 0)
                (incf contador_filas)
            )
        )
    )
)

(defun definir_numero_vertices()
    (format t "Ingrese el numero de vertices del grafo ~%")
    (setf *numero_vertices* (read)) 
)

(defun definir_vertice_inicial()
    (format t "Ingrese el vertice por el que iniciara DFS ~%")
    (setf *vertice_inicial* (read))
)

(defun insertar_matriz_adyacencia()
    (loop for i from 0 to (- *numero_vertices* 1) do
        (loop for j from 0 to (- *numero_vertices* 1) do
            (format t "Ingrese el valor para la posicion i: ~a j: ~a ~%" i j)
            (setf (aref *adyacencia_matriz* i j) (read))
        )
    )
)

(defun imprimir_vector_estados ()
    (format t "Vector de estados = ") 
    (loop for j from 0 to (- *numero_vertices* 1) do
        (format t "~a " (aref *vector_estados* j))  
    )
    (format t "~%")  
) 

(defun imprimir_lista_aristas ()
    (let ((anterior 0) (contador 0))  
        (format t "Lista de aristas = ")
        (loop for j in *lista_aristas* do 
            (if (= (mod contador 2) 1)
                (format t "(~a,~a), " anterior j) 
                    (setf anterior j) ;else  
            )
            ;(format t "j{~a} " j)
            ;(format t "anterior{~a} " anterior) 
            (incf contador)
        )
    )
    (format t "~%")     
)

(defun dfs (numero_en_pila)
    (loop for j from 0 to (- *numero_vertices* 1) do
            (when (= (aref *adyacencia_matriz* numero_en_pila j) 1)
                (setf (aref *adyacencia_matriz* numero_en_pila j) 0)
                (when (= (aref *vector_estados* j) -1)
                    (setf (aref *vector_estados* j) 0)
                    (push j *pila*)
                    (setf *lista_vertices_alcanzables* (append *lista_vertices_alcanzables* (list j)))  
                    (setf *lista_aristas* (append *lista_aristas* (list numero_en_pila)))
                    (setf *lista_aristas* (append *lista_aristas* (list j)))
                    (format t "Pila = ~a ~%" *pila*)  
                    (format t "Lista de nodos alcanzables ~a ~%" *lista_vertices_alcanzables*)
                    (format t "Lista de aristas ~a ~%" *lista_aristas*)
                )
                (unless (null *pila*)
                    (dfs (car *pila*))
                )
            )
    )
    (setf (aref *vector_estados* numero_en_pila) 1)
    (when *pila*
        (pop *pila*)
    )
    ;(format t "Pila = ~a ~%" *pila*)
)

(main)
