CREATE DATABASE IF NOT EXISTS votacion_desis_prueba;
USE votacion_desis_prueba;

## CREACION DE TABLAS ##
CREATE TABLE region (
	id_region INT PRIMARY KEY auto_increment,
    nombre_region VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE comuna (
	id_comuna INT PRIMARY KEY auto_increment,
    id_region INT NOT NULL,
    nombre_comuna VARCHAR (50) NOT NULL,
    FOREIGN KEY (id_region) REFERENCES region (id_region)
);

CREATE TABLE candidato (
	id_candidato INT PRIMARY KEY auto_increment,
    nombre_candidato TEXT NOT NULL UNIQUE 
);

CREATE TABLE medio_informacion (
	id_medio INT PRIMARY KEY auto_increment,
    nombre_medio VARCHAR (50) NOT NULL UNIQUE
);

CREATE TABLE voto (
	rut_voto VARCHAR (12) PRIMARY KEY ,
    nombre_votante TEXT NOT NULL,
    alias VARCHAR(50) NOT NULL UNIQUE,
    correo TEXT NOT NULL UNIQUE,
    id_comuna INT NOT NULL,
    id_candidato INT NOT NULL,
    id_medio_informacion INT NOT NULL,
    fecha_voto TIMESTAMP,
    FOREIGN KEY (id_comuna) REFERENCES comuna (id_comuna),
    FOREIGN KEY (id_candidato) REFERENCES candidato (id_candidato),
    FOREIGN KEY (id_medio_informacion) REFERENCES medio_informacion (id_medio)
);

## INSERCION DE DATOS ## 
	## REGIONES Z
INSERT INTO region (nombre_region) VALUES ('Arica y Parinacota');
INSERT INTO region (nombre_region) VALUES ('Tarapacá');
INSERT INTO region (nombre_region) VALUES ('Antofagasta');
INSERT INTO region (nombre_region) VALUES ('Atacama');
INSERT INTO region (nombre_region) VALUES ('Coquimbo');
INSERT INTO region (nombre_region) VALUES ('Valparaíso');
INSERT INTO region (nombre_region) VALUES ('Metropolitana de Santiago');
INSERT INTO region (nombre_region) VALUES ('Libertador General Bernardo O\'Higgins');
INSERT INTO region (nombre_region) VALUES ('Maule');
INSERT INTO region (nombre_region) VALUES ('Ñuble');
INSERT INTO region (nombre_region) VALUES ('Biobío');
INSERT INTO region (nombre_region) VALUES ('La Araucanía');
INSERT INTO region (nombre_region) VALUES ('Los Ríos');
INSERT INTO region (nombre_region) VALUES ('Los Lagos');
INSERT INTO region (nombre_region) VALUES ('Aysén del General Carlos Ibáñez del Campo');
INSERT INTO region (nombre_region) VALUES ('Magallanes y de la Antártica Chilena');

	##COMUNAS
-- Región de Arica y Parinacota (ID: 1)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (1, 'Arica');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (1, 'Putre');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (1, 'General Lagos');

-- Región de Tarapacá (ID: 2)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (2, 'Iquique');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (2, 'Alto Hospicio');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (2, 'Pozo Almonte');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (2, 'Camiña');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (2, 'Colchane');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (2, 'Huara');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (2, 'Pica');

-- Región de Antofagasta (ID: 3)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'Antofagasta');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'Mejillones');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'Sierra Gorda');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'Taltal');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'Calama');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'Ollagüe');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'San Pedro de Atacama');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'María Elena');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (3, 'Tocopilla');

-- Región de Atacama (ID: 4)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Copiapó');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Caldera');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Tierra Amarilla');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Chañaral');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Diego de Almagro');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Vallenar');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Alto del Carmen');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Freirina');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (4, 'Huasco');

-- Región de Coquimbo (ID: 5)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'La Serena');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Coquimbo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Andacollo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'La Higuera');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Paiguano');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Vicuña');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Illapel');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Canela');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Los Vilos');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Salamanca');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Ovalle');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Combarbalá');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Monte Patria');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Punitaqui');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (5, 'Río Hurtado');

-- Región de Valparaíso (ID: 6)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Valparaíso');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Viña del Mar');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Concón');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Quilpué');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Villa Alemana');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Quintero');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Puchuncaví');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Casablanca');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Juan Fernández');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Isla de Pascua');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Los Andes');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Calle Larga');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'San Esteban');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Rinconada');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'La Ligua');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Cabildo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Papudo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Petorca');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Zapallar');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Quillota');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'La Calera');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Hijuelas');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'La Cruz');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Nogales');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'San Antonio');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Algarrobo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Cartagena');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'El Quisco');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'El Tabo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Santo Domingo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'San Felipe');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Catemu');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Llaillay');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Panquehue');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Putaendo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Santa María');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Quilpué');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Limache');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Olmué');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (6, 'Villa Alemana');

-- Región Metropolitana de Santiago (ID: 7)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Santiago');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Independencia');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Recoleta');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Las Condes');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Vitacura');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Lo Barnechea');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Ñuñoa');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Providencia');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'San Miguel');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Macul');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'La Florida');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Puente Alto');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'La Pintana');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'San Ramón');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'La Granja');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'El Bosque');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'La Cisterna');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'San Bernardo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Paine');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Melipilla');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Peñaflor');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Talagante');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Calera de Tango');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Isla de Maipo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'Buin');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (7, 'San José de Maipo');

-- Región de Libertador General Bernardo O'Higgins (ID: 8)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Rancagua');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Machalí');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'San Fernando');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Santa Cruz');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'San Vicente de Tagua Tagua');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Pichilemu');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Graneros');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Palmilla');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Peumo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (8, 'Las Cabras');

-- Región del Maule (ID: 9)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Talca');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Curicó');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Linares');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Constitución');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Cauquenes');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Molina');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'San Clemente');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Longaví');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Romeral');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (9, 'Villa Alegre');

-- Región de Ñuble (ID: 10)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'Chillán');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'Quillón');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'Bulnes');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'San Carlos');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'Coelemu');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'Coihueco');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'Yungay');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'El Carmen');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'Portezuelo');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (10, 'San Ignacio');

-- Región del Biobío (ID: 11)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Concepción');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Talcahuano');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Coronel');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Chiguayante');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'San Pedro de la Paz');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Hualpén');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Tomé');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Penco');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Lota');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (11, 'Santa Juana');

-- Región de La Araucanía (ID: 12)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (12, 'Temuco');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (12, 'Padre Las Casas');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (12, 'Villarrica');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (12, 'Pucón');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (12, 'Angol');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (12, 'Victoria');

-- Región de Los Ríos (ID: 13)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Valdivia');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'La Unión');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Corral');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Lanco');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Mariquina');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Panguipulli');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Los Lagos');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Paillaco');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Futrono');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (13, 'Río Bueno');

-- Región de Los Lagos (ID: 14)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Puerto Montt');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Osorno');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Castro');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Ancud');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Puerto Varas');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Frutillar');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Llanquihue');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Calbuco');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Quellón');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (14, 'Maullín');

-- Región de Aysén del General Carlos Ibáñez del Campo (ID: 15)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Coyhaique');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Aysén');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Chile Chico');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Cochrane');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Puerto Aisén');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Cisnes');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Guaitecas');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Lago Verde');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'O’Higgins');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (15, 'Río Ibáñez');

-- Región de Magallanes y de la Antártica Chilena (ID: 16)
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Punta Arenas');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Puerto Natales');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Porvenir');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Natales');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Torres del Paine');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Laguna Blanca');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'San Gregorio');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Río Verde');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Primavera');
INSERT INTO comuna (id_region, nombre_comuna) VALUES (16, 'Timaukel');

## CANDIDATOS
INSERT INTO candidato (nombre_candidato) VALUES ('Juan Diaz');
INSERT INTO candidato (nombre_candidato) VALUES ('Jose Perez');
INSERT INTO candidato (nombre_candidato) VALUES ('Maria Jimenez');
INSERT INTO candidato (nombre_candidato) VALUES ('Andrea Campos');

## MEDIOS DE INFORMACION
INSERT INTO medio_informacion (nombre_medio) VALUES ('Web');
INSERT INTO medio_informacion (nombre_medio) VALUES ('TV');
INSERT INTO medio_informacion (nombre_medio) VALUES ('Redes Sociales');
INSERT INTO medio_informacion (nombre_medio) VALUES ('Amigo');