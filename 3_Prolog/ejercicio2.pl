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
