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


% 1 Es el gorila descendiente de hominini
% Consulta: descendiente(gorilla, hominini).
% Respuesta: false

% 2 Es el Homo hermano del gorila?
% Consulta: hermano(homo, gorilla).
% Respuesta: false (no comparten el mismo padre directo)

% 3 Son el Homo y el Gorilla de la misma subfamilia?
% Consulta: mismo_padre(homo, gorilla, homininae).
% Respuesta: false (están en diferentes tribus dentro de homininae)

% 4 Tiene Hominini la misma familia que Pongo?
% Consulta: ancestro(hominidea, hominini), ancestro(hominidea, pongo).
% Respuesta: true 

% 5 Quiénes son los descendientes directos de una tribu?
% Consulta: descendiente_directo(X, hominini).
% Respuesta: homo, pan

% 6 Cuál es la superfamilia a la que pertenece Hylobates?
% Consulta: ancestro(hominoidea, hylobates).
% Respuesta: hominoidea

% 7 Qué géneros comparten la misma subfamilia con Pan?
% Consulta: ancestro(homininae, pan), ancestro(homininae, X), de_nivel(X, genus).
% Respuesta: homo, gorilla

% 8 Cuál es el ancestro común más cercano entre Homo y Gorilla?
% Consulta: ancestro_comun(homo, gorilla, X).
% Respuesta: homininae

% 9 Es el orangután un homínido?
% Consulta: descendiente(orangutan, hominidea).
% Respuesta: true

% 10 Cuáles son todas las especies que pertenecen a la familia Hominidea?
% Consulta: descendiente(X, hominidea), de_nivel(X, species).

% 11 Qué géneros son hermanos  de Homo?
% Consulta: hermano(homo, X), de_nivel(X, genus).
% Respuesta: pan

% 12 Comparten Homo y Hylobates la misma familia?
% Consulta: ancestro(F, homo), ancestro(F, hylobates), de_nivel(F, family).
% Respuesta: false

% 13 Cuáles son los descendientes directos de la subfamilia Homininae?
% Consulta: descendiente_directo(X, homininae).
% Respuesta: hominini, gorillini

% 14 Qué géneros están bajo la familia Hominidea?
% Consulta: descendiente(X, hominidea), de_nivel(X, genus).
% Respuesta: homo, pan, gorilla, pongo

% 15 Cuál es la ruta completa desde Homo hasta la superfamilia?
% Consulta: ruta(homo, R).
% Respuesta: [homo, hominini, homininae, hominidea, hominoidea]