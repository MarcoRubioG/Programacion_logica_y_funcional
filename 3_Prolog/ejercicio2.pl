% Primera Generacion
pertenece(hominoidea, root, superfamily).

% Segunda Generacion 
pertenece(hominidea, hominoidea, family).
pertenece(hylobatidae, hominoidea, family).

% Tercera generacion 
pertenece(homininae, hominidea, subfamily).
pertenece(ponginae, hominidea, subfamily).

% Cuarta Generacion
pertenece(hominini, homininae, tribe).
pertenece(gorillini, homininae, tribe).

% Quinta generacion
pertenece(homo, hominini, genus).
pertenece(pan, hominini, genus).
pertenece(gorilla, gorillini, genus).
pertenece(pongo, ponginae, genus).
pertenece(hylobates, hylobatidae, genus).

% Especies
pertenece(human, homo, species).
pertenece(bonobo, pan, species).
pertenece(chimpanzee, pan, species).
pertenece(gorilla_gorilla, gorilla, species).
pertenece(orangutan, pongo, species).
pertenece(gibbon, hylobates, species).

% REGLAS

% Sacamos los decendientes directos 
descendiente_directo(X, Y) :- 
    pertenece(X, Y, _).

% Descendiente indirectos 
descendiente(X, Y) :- 
    pertenece(X, Y, _).
descendiente(X, Y) :- 
    pertenece(X, Z, _), 
    descendiente(Z, Y).

% Ancestros
ancestro(X, Y) :- 
    descendiente(Y, X).

% Hermanos con el mismo padre
hermano(X, Y) :- 
    pertenece(X, P, _), 
    pertenece(Y, P, _), 
    X \= Y.

% Misma categoría
misma_categoria(X, Y, Categoria) :- 
    pertenece(X, _, Categoria), 
    pertenece(Y, _, Categoria), 
    X \= Y.

% Mismo padre 
mismo_padre(X, Y, Padre) :- 
    pertenece(X, Padre, _), 
    pertenece(Y, Padre, _), 
    X \= Y.

% Todo lo que pertence ese nivel
de_nivel(X, Nivel) :- 
    pertenece(X, _, Nivel).

% Ruta desde un elemento hasta la raíz
ruta(X, [X]) :- 
    pertenece(X, root, _).
ruta(X, [X|Resto]) :- 
    pertenece(X, Padre, _), 
    Padre \= root, 
    ruta(Padre, Resto).

% Ancestro común más cercano
ancestro_comun(X, Y, Ancestro) :- 
    descendiente(X, Ancestro), 
    descendiente(Y, Ancestro).