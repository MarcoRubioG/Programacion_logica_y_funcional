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