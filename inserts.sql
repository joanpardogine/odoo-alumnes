-- Inserir dades en MODULS_PROFESSIONALS
INSERT INTO MODULS_PROFESSIONALS (nom_modul, hores_totals_modul) VALUES
    ("Sistemes informàtics", 121),
    ("Bases de dades", 110),
    ("Programació", 187),
    ("Llenguatge de marques i sistemes de gestió de la informació", 77),
    ("Entorns de desenvolupament", 55),
    ("Accés a dades", 88),
    ("Desenvolupament d'interfícies", 88),
    ("Programació multimèdia i dispositius mòbils", 77),
    ("Programació de serveis i processos", 55),
    ("Sistemes de gestió empresarial", 55),
    ("Formació i orientació laboral", 66),
    ("Empresa i iniciativa emprenedora", 66),
    ("Projecte de desenvolupament d'aplicacions multiplataforma", 297),
    ("Formació en centres de treball", 383),
    ("Disseny 2D i 3D", 88),
    ("Programació de videojocs 2D i 3D", 154);

-- Obtenir els codis dels mòduls
SET @codi_sistemes_informatics := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Sistemes informàtics");
SET @codi_bases_dades := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Bases de dades");
SET @codi_programacio := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Programació");
SET @codi_llenguatge_marques := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Llenguatge de marques i sistemes de gestió de la informació");
SET @codi_entorns_desenvolupament := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Entorns de desenvolupament");
SET @codi_acces_dades := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Accés a dades");
SET @codi_desenvolupament_interficies := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Desenvolupament d'interfícies");
SET @codi_programacio_multimedia := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Programació multimèdia i dispositius mòbils.");
SET @codi_programacio_serveis := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Programació de serveis i processos");
SET @codi_sistemes_gestio := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Sistemes de gestió empresarial");
SET @codi_formacio_orientacio := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Formació i orientació laboral.");
SET @codi_empresa_iniciativa := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Empresa i iniciativa emprenedora.");
SET @codi_projecte_multiplataforma := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Projecte de desenvolupament d'aplicacions multiplataforma.");
SET @codi_formacio_centres_treball := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Formació en centres de treball.");
SET @codi_disseny_2D_3D := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Disseny 2D i 3D.");
SET @codi_programacio_videojocs := (SELECT codi_mp FROM MODULS_PROFESSIONALS WHERE nom_modul = "Programació de videojocs 2D i 3D.");

-- Inserir dades en UNITATS_FORMATIVES
INSERT INTO UNITATS_FORMATIVES (codi_mp, nom_uf, hores_totals_uf) VALUES
    (@codi_sistemes_informatics, 'UF01', 45),
    (@codi_sistemes_informatics, 'UF02', 36),
    (@codi_sistemes_informatics, 'UF03', 18),
    (@codi_sistemes_informatics, 'UF04', 22),
    (@codi_bases_dades, 'UF01', 15),
    (@codi_bases_dades, 'UF02', 38),
    (@codi_bases_dades, 'UF03', 29),
    (@codi_bases_dades, 'UF04', 28),
    (@codi_programacio, 'UF01', 54),
    (@codi_programacio, 'UF02', 40),
    (@codi_programacio, 'UF03', 25),
    (@codi_programacio, 'UF04', 30),
    (@codi_programacio, 'UF05', 38),
    (@codi_llenguatge_marques, 'UF01', 39),
    (@codi_llenguatge_marques, 'UF02', 23),
    (@codi_llenguatge_marques, 'UF03', 15),
    (@codi_entorns_desenvolupament, 'UF01', 18),
    (@codi_entorns_desenvolupament, 'UF02', 18),
    (@codi_entorns_desenvolupament, 'UF03', 19),
    (@codi_acces_dades, 'UF01', 22),
    (@codi_acces_dades, 'UF02', 22),
    (@codi_acces_dades, 'UF03', 22),
    (@codi_acces_dades, 'UF04', 22),
    (@codi_desenvolupament_interficies, 'UF01', 67),
    (@codi_desenvolupament_interficies, 'UF02', 21),
    (@codi_programacio_multimedia, 'UF01', 36),
    (@codi_programacio_multimedia, 'UF02', 18),
    (@codi_programacio_multimedia, 'UF03', 23),
    (@codi_programacio_serveis, 'UF01', 32),
    (@codi_programacio_serveis, 'UF02', 23),
    (@codi_sistemes_gestio, 'UF01', 27),
    (@codi_sistemes_gestio, 'UF02', 28),
    (@codi_formacio_orientacio, 'UF01', 33),
    (@codi_formacio_orientacio, 'UF02', 33),
    (@codi_empresa_iniciativa, 'UF01', 66),
    (@codi_projecte_multiplataforma, 'UF01', 297),
    (@codi_formacio_centres_treball, 'UF01', 383),
    (@codi_disseny_2D_3D, 'UF01', 30),
    (@codi_disseny_2D_3D, 'UF02', 58),
    (@codi_programacio_videojocs, 'UF01', 33),
    (@codi_programacio_videojocs, 'UF02', 33),
    (@codi_programacio_videojocs, 'UF03', 44),
    (@codi_programacio_videojocs, 'UF04', 44);
