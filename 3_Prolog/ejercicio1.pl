% CEO y Chairman
cargo(mark_zuckerberg, ceo_chairman).

% Reportan directamente a Mark Zuckerberg
reporta_a(sheryl_sandberg, mark_zuckerberg).
reporta_a(david_wehner, mark_zuckerberg).
reporta_a(timothy_campos, mark_zuckerberg).
reporta_a(mike_schroepfer, mark_zuckerberg).
reporta_a(elliot_schrage, mark_zuckerberg).
reporta_a(lori_goler, mark_zuckerberg).

% Cargos principales
cargo(sheryl_sandberg, coo).
cargo(david_wehner, cfo).
cargo(timothy_campos, cio).
cargo(mike_schroepfer, cto).
cargo(elliot_schrage, cmo).
cargo(lori_goler, hr).

% Reportan a Elliot Schrage
reporta_a(robert_van_dyk, elliot_schrage).
reporta_a(stanley_freifeld, elliot_schrage).

cargo(robert_van_dyk, cdo).
cargo(stanley_freifeld, global_mkt).

% Rebecca y Heather reportan a Elliot Schrage
reporta_a(rebecca, elliot_schrage).
reporta_a(heather, elliot_schrage).



% 1 Quién es el jefe de Rebecca
jefe_de(Empleado, Jefe) :- reporta_a(Empleado, Jefe).

% 2. Es jefe Mark del jefe de Rebecca
es_jefe_mark_del_jefe_de(Empleado) :- 
    reporta_a(Empleado, Jefe),
    reporta_a(Jefe, mark_zuckerberg).

% 3 Es Lori jefe de alguien
es_jefe(Persona) :- reporta_a(_, Persona).

% 4 Mostrar empleados del jefe de Heather
empleados_del_jefe_de(Persona, Empleado) :- 
    reporta_a(Persona, Jefe),
    reporta_a(Empleado, Jefe),
    Persona \= Empleado.

% 5 Es Timothy jefe de Rebecca
es_jefe_de(Jefe, Empleado) :- reporta_a(Empleado, Jefe).

% 6 Mostrar compañeros de nivel de Mike
companeros_nivel(Persona, Companero) :- 
    reporta_a(Persona, Jefe),
    reporta_a(Companero, Jefe),
    Persona \= Companero.

% 7 Es el jefe de Rebecca compañero de nivel de David
jefe_es_companero_de(Empleado, Persona) :- 
    reporta_a(Empleado, Jefe),
    reporta_a(Jefe, JefeComun),
    reporta_a(Persona, JefeComun),
    Jefe \= Persona.


% Pregunta 1: ¿Quién es el jefe de Rebecca?
% Respuesta: jefe_de(rebecca, X).

% Pregunta 2: ¿Es jefe Mark del jefe de Rebecca?
% Respuesta: es_jefe_mark_del_jefe_de(rebecca).

% Pregunta 3: ¿Es Lori jefe de alguien?
% Respuesta: es_jefe(lori_goler).

% Pregunta 4: Mostrar empleados del jefe de Heather
% Respuesta: empleados_del_jefe_de(heather, X).

% Pregunta 5: ¿Es Timothy jefe de Rebecca?
% Respuesta: es_jefe_de(timothy_campos, rebecca).

% Pregunta 6: Mostrar compañeros de nivel de Mike
% Respuesta: companeros_nivel(mike_schroepfer, X).

% Pregunta 7: ¿Es el jefe de Rebecca compañero de nivel de David?
% Respuesta: jefe_es_companero_de(rebecca, david_wehner).

% Pregunta 8: ¿Es compañero de nivel Mike de Lori?
% Respuesta: companeros_nivel(mike_schroepfer, lori_goler).