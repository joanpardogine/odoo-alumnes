-- Crear la base de dades
CREATE DATABASE IF NOT EXISTS notesCicles;
USE notesCicles;

-- Crear la tabla ALUMNES
CREATE TABLE IF NOT EXISTS ALUMNES (
    codi_alumne INT AUTO_INCREMENT PRIMARY KEY,
    codi_alumne_extern VARCHAR(6),
    dni_alumne VARCHAR(20),
    nom_alumne VARCHAR(255),
    data_naix_alumne DATE,
    adreca_alumne VARCHAR(255),
    cp_alumne VARCHAR(10),
    poblacio_alumne VARCHAR(255),
    comarca_alumne VARCHAR(255),
    provincia_alumne VARCHAR(255),
    correu_alumne VARCHAR(255)
);

-- Crear la tabla MODULS_PROFESSIONALS
CREATE TABLE IF NOT EXISTS MODULS_PROFESSIONALS (
    codi_mp INT AUTO_INCREMENT PRIMARY KEY,
    nom_modul VARCHAR(255),
    hores_totals_modul INT
);

-- Crear la tabla UNITATS_FORMATIVES
CREATE TABLE IF NOT EXISTS UNITATS_FORMATIVES (
    codi_uf INT AUTO_INCREMENT PRIMARY KEY,
    codi_mp INT,
    nom_uf VARCHAR(255),
    hores_totals_uf INT,
    FOREIGN KEY (codi_mp) REFERENCES MODULS_PROFESSIONALS(codi_mp)
);

-- Crear la tabla NOTES_MODULS_PROFESSIONALS
CREATE TABLE IF NOT EXISTS NOTES_MODULS_PROFESSIONALS (
    codi_alumne INT,
    codi_mp INT,
    nota_modul DECIMAL(5, 2),
    PRIMARY KEY (codi_alumne, codi_mp),
    FOREIGN KEY (codi_alumne) REFERENCES ALUMNES(codi_alumne),
    FOREIGN KEY (codi_mp) REFERENCES MODULS_PROFESSIONALS(codi_mp)
);

-- Crear la tabla NOTAS_UNITATS_FORMATIVES
CREATE TABLE IF NOT EXISTS NOTAS_UNITATS_FORMATIVES (
    codi_alumne INT,
    codi_mp INT,
    codi_uf INT,
    nota_uf DECIMAL(5, 2),
    PRIMARY KEY (codi_alumne, codi_mp, codi_uf),
    FOREIGN KEY (codi_alumne) REFERENCES ALUMNES(codi_alumne),
    FOREIGN KEY (codi_mp) REFERENCES MODULS_PROFESSIONALS(codi_mp),
    FOREIGN KEY (codi_uf) REFERENCES UNITATS_FORMATIVES(codi_uf)
);
