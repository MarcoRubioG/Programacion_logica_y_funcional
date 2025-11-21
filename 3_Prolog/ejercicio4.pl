%Comparar área del circulo
area_circulo(Radio, Area):- Area is pi * Radio ** 2.

%comparar_area(10,12,Resultado).
comparar_area(Radio, Limite, Resultado):-
    area_circulo(Radio, Area),
    (Area > Limite -> Resultado =' Mayor';
     Area =:= Limite -> Resultado = 'Igual';
    Resultado ='Menor'
     ).
    
%comparar perimetro de un cuadrado
perimetro_cuadrado(Lado, Perimetro):- Perimetro is 4 * Lado.

%comparar_perimetro(5, 20, Resultado).
comparar_perimetro(Lado, Limite, Resultado):-
    perimetro_cuadrado(Lado, Perimetro),
    (Perimetro > Limite -> Resultado = 'Mayor';
     Perimetro =:= Limite -> Resultado = 'Igual';
     Resultado = 'Menor'
    ).

%verificar si el numero es positivo o negativo o cero
%verificar_signo(-5, Resultado).
%verificar_signo(0, Resultado).
verificar_signo(Numero, Resultado):-
    (Numero > 0 -> Resultado = 'Positivo';
     Numero =:= 0 -> Resultado = 'Cero';
     Resultado = 'Negativo'
    ).



%comparar la raiz cuadrada con un valor
raiz_cuadrada(Numero, Raiz):- Raiz is sqrt(Numero).

%comparar_raiz(16, 4, Resultado).
comparar_raiz(Numero, Limite, Resultado):-
    raiz_cuadrada(Numero, Raiz),
    (Raiz > Limite -> Resultado = 'Mayor';
     Raiz =:= Limite -> Resultado = 'Igual';
     Resultado = 'Menor'
    ).

% calcular el area de un triangulo y si es mayor que 50
area_triangulo(Base, Altura, Area):- Area is (Base * Altura) / 2.

%verificar_area_triangulo(10, 12, Resultado).
verificar_area_triangulo(Base, Altura, Resultado):-
    area_triangulo(Base, Altura, Area),
    (Area > 50 -> Resultado = 'Mayor que 50';
     Resultado = 'Menor o igual que 50'
    ).

%es par o impar
%verificar_parimpar(7, Resultado).
verificar_parimpar(Numero, Resultado):-
    (Numero mod 2 =:= 0 -> Resultado = 'Par';
     Resultado = 'Impar'
    ).

%Comparar logaritmo natural
logaritmo_natural(Numero, Log):- Log is log(Numero).

%comparar_logaritmo(10, 2, Resultado).
comparar_logaritmo(Numero, Limite, Resultado):-
    logaritmo_natural(Numero, Log),
    (Log > Limite -> Resultado = 'Mayor';
     Log =:= Limite -> Resultado = 'Igual';
     Resultado = 'Menor'
    ).

%sacar potencia y saber si es mayor a 100
calcular_potencia(Base, Exponente, Potencia):- Potencia is Base ** Exponente.

%verificar_potencia(2, 7, Resultado).
verificar_potencia(Base, Exponente, Resultado):-
    calcular_potencia(Base, Exponente, Potencia),
    (Potencia > 100 -> Resultado = 'Supera 100';
     Resultado = 'No supera 100'
    ).
