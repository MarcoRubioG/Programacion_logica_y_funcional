%Comparar área del circulo
area_circulo(Radio, Area):- Area is pi * Radio ** 2.

%comparar_area(10,12,Resultado).
comparar_area(Radio, Limite, Resultado):-
    area_circulo(Radio, Area),
    (Area > Limite -> Resultado =' Mayor';
     Area =:= Limite -> Resultado = 'Igual';
    Resultado ='Menor'
     ).