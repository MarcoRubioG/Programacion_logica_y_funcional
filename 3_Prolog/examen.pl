% 1 derivados 

% Derivados directos de Fortran
derivado(fortran, algol).
derivado(fortran, basic).

% Derivados de ALGOL
derivado(algol, simula).
derivado(algol, pascal).

% Derivados de Simula
derivado(simula, smalltalk).

% Derivados de Smalltalk
derivado(smalltalk, self).
derivado(smalltalk, objective_c).
derivado(smalltalk, python).

% Derivados de Self
derivado(self, javascript).

% Derivados de Pascal
derivado(pascal, delphi).
derivado(pascal, modula_2).

% Derivados de Modula-2
derivado(modula_2, modula_3).
derivado(modula_2, oberon).

% Derivados de BASIC
derivado(basic, visual_basic).

% Derivados adicionales observados en el diagrama
derivado(algol, clu).


% 2  sacar los directos de fortran 
derivados_directos_fortran(Lista) :-
findall(X, derivado(fortran, X), Lista).

% 3  responder pregunta si javascript es derivador de self
javascript_deriva_de_self :-
    es_derivado(self, javascript).

 %sacmos los derivados por si los necesito
es_derivado_directo(Padre, Hijo) :-
    derivado(Padre,Hijo).

es_derivado(Padre, Hijo) :-
derivado(Padre, Hijo).

es_derivado(Ancestro, Descendiente) :-
    derivado(Ancestro, Intermedio),
    es_derivado(Intermedio, Descendiente).

%4 Son superbasico y visual basic

son_hermanos(L1, L2) :-
    derivado(Padre, L1),
    derivado(Padre, L2),
    L1 \= L2.

superbasic_visualbasic_hermanos :-
    son_hermanos(superbasic, visual_basic).


%5 cree una regla que calcula que tan lejos 
%esta un lenguaje de Fortran en el árbol genealógico

generacion(fortran, 0).

generacion(Lenguaje, Gen) :-
    derivado(Padre, Lenguaje),
    generacion(Padre, GenPadre),
    Gen is GenPadre + 1.

%6 egla con expresión aritmética

% Calcula la distancia generacional entre dos lenguajes
distancia_generacional(L1, L2, Distancia) :-
    generacion(L1, Gen1),
    generacion(L2, Gen2),
    Distancia is abs(Gen1 - Gen2).

% Predicado para calcular descendientes totales de un lenguaje
contar_descendientes(Lenguaje, Total) :-
    findall(Desc, es_derivado(Lenguaje, Desc), Lista),
    length(Lista, Total).

%7  Regla con comparador sacamos el  lenguaje más influyente

es_mas_influyente(L1, L2) :-
    contar_descendientes(L1, Total1),
    contar_descendientes(L2, Total2),
    Total1 > Total2.



%Poner respuestas 
%1
%?- derivado(fortran, X).
%?- derivado(algol, X).
%?- derivado(self, javascript).

%2
%?- derivados_directos_fortran(Lista).

%3
%?- javascript_deriva_de_self.
%4
%?- superbasic_visualbasic_hermanos.
%5
%?- superbasic_visualbasic_hermanos.
%?- generacion(algol, G).
%?- generacion(javascript, G).
%?- generacion(python, G).
%6
%?- distancia_generacional(fortran, javascript, D).
%?- distancia_generacional(algol, python, D).
%?- distancia_generacional(pascal, javascript, D).
%7
%?- es_mas_influyente(fortran, algol).

