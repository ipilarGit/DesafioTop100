-- Desafio Top 100

-- Requerimientos:

-- Req.1. Crear una base de datos llamada peliculas
CREATE DATABASE peliculas;

-- Req.2. Cargar ambos archivos a su tabla correspondiente

CREATE TABLE peliculas(id INT, nombre_pelicula VARCHAR(100), year_estreno INT, director VARCHAR(30), PRIMARY KEY(id));
peliculas=# \copy peliculas FROM 'C:\Users\Dell\Desktop\ApoyoDesafioTop100\peliculas.csv' csv header;
COPY 100

CREATE TABLE reparto (id_pelicula INT, nombre_actor VARCHAR(50), FOREIGN KEY(id_pelicula) REFERENCES peliculas(id));
peliculas=# \copy reparto FROM 'C:\Users\Dell\Desktop\ApoyoDesafioTop100\reparto.csv' csv;
COPY 1051

-- Req.3. Obtener el ID de la pelicula "Titanic"
peliculas=# SELECT id FROM peliculas WHERE nombre_pelicula = 'Titanic';
 id
----
  2
(1 fila)

-- Req.4. Listar a todos los actores que aparecen en la pelicula "Titanic"
peliculas=# SELECT nombre_actor FROM reparto WHERE id_pelicula = 2;

   nombre_actor
-------------------
 Leonardo DiCaprio
 Kate Winslet
 Billy Zane
 Kathy Bates
 Frances Fisher
 Bernard Hill
 Jonathan Hyde
 Danny Nucci
 David Warner
 Bill Paxton
 Gloria Stuart
 Victor Garber
 Suzy Amis
(13 filas)


-- Req.5. Consultar en cuantas peliculas del top 100 participa "Harrison Ford"
peliculas=# SELECT id_pelicula , COUNT(*) FROM reparto WHERE nombre_actor = 'Harrison Ford' GROUP BY id_pelicula;
 id_pelicula | count
-------------+-------
          48 |     1
          59 |     1
          63 |     1
          67 |     1
          69 |     1
          87 |     1
          88 |     1
          97 |     1
(8 filas)

-- Req.6. Indicar las peliculas estrenadas entre los años 1990  y 1999 ordenadas por titulo de manera ascendente
peliculas=# SELECT nombre_pelicula AS pelicula, id, year_estreno AS año_de_estreno FROM peliculas WHERE year_estreno BETWEEN 1990 AND 1999 ORDER BY nombre_pelicula ASC;

                pelicula                  | id | año_de_estreno
--------------------------------------------+----+----------------
 American Beauty                            | 76 |           1999
 American History X                         | 20 |           1998
 Braveheart                                 |  9 |           1995
 Cadena perpetua                            |  7 |           1994
 Eduardo Manostijeras                       | 12 |           1990
 El club de la pelea                        | 27 |           1999
 El Padrino. Parte III                      | 68 |           1990
 El profesional                             | 75 |           1994
 El sexto sentido                           | 22 |           1999
 El show de Truman                          | 45 |           1998
 El silencio de los corderos                | 25 |           1991
 Entrevista con el vampiro                  | 61 |           1994
 Forest Gump                                |  1 |           1994
 Hombres de negro                           | 42 |           1997
 La lista de Schindler                      | 10 |           1993
 La milla verde                             | 31 |           1999
 Matrix                                     | 30 |           1999
 Mejor... imposible                         | 89 |           1997
 Parque Jur├ísico                           | 29 |           1993
 Pesadilla antes de navidad                 | 47 |           1993
 Pulp Fiction                               | 23 |           1994
 Salvar al soldado Ryan                     | 14 |           1998
 Seven                                      | 39 |           1995
 Star Wars. Episodio I: La amenaza fantasma | 86 |           1999
 Terminator 2: el juicio final              | 40 |           1991
 Titanic                                    |  2 |           1997
 Toy Story                                  | 11 |           1995
 Toy Story 2                                | 46 |           1999
 Trainspotting                              | 79 |           1996
 Uno de los nuestros                        | 98 |           1990
(30 filas)


--Req.7. Hacer una consulta SQL que agrupe los titulos con su longitud, la longitud debe dser nombrada
-- para la consulta como "longitud_titulo"
peliculas=# SELECT nombre_pelicula AS pelicula, LENGTH(nombre_pelicula) AS longitud_titulo FROM peliculas GROUP BY nombre_pelicula, LENGTH(nombre_pelicula) ORDER BY LENGTH(nombre_pelicula) ASC;

                       pelicula                        | longitud_titulo
-------------------------------------------------------+-----------------
 300                                                   |               3
 E.T                                                   |               3
 Saw                                                   |               3
 Alien                                                 |               5
 Rambo                                                 |               5
 Rocky                                                 |               5
 Seven                                                 |               5
 Grease                                                |               6
 Matrix                                                |               6
 Wall-E                                                |               6
 Am├®lie                                               |               7
 Ben-Hur                                               |               7
 Titanic                                               |               7
 X-Men 2                                               |               7
 Iron Man                                              |               8
 Predator                                              |               8
 Psicosis                                              |               8
 Tibur├│n                                              |               8
 Gladiator                                             |               9
 King Kong                                             |               9
 Toy Story                                             |               9
 axi driver                                            |              10
 Braveheart                                            |              10
 Casablanca                                            |              10
 El Padrino                                            |              10
 Spider-Man                                            |              10
 Terminator                                            |              10
 Forest Gump                                           |              11
 Infiltrados                                           |              11
 Ratatouille                                           |              11
 Toy Story 2                                           |              11
 Blade Runner                                          |              12
 El exorcista                                          |              12
 Pulp Fiction                                          |              12
 Spider-Man 2                                          |              12
 Transformers                                          |              12
 Batman Begins                                         |              13
 El resplandor                                         |              13
 Mouling Rouge                                         |              13
 Trainspotting                                         |              13
 V de Vendetta                                         |              13
 Apocalypse Now                                        |              14
 El profesional                                        |              14
 La milla verde                                        |              14
 Monstruos S.A.                                        |              14
 Ocean's Eleven                                        |              14
 American Beauty                                       |              15
 Buscando a Nemo                                       |              15
 Cadena perpetua                                       |              15
 Escuela de Rock                                       |              15
 Los incre├¡bles                                       |              15
 El sexto sentido                                      |              16
 Hombres de negro                                      |              16
 Kill Bill Vol. 1                                      |              16
 Kill Bill Vol. 2                                      |              16
 La vida de Brian                                      |              16
 Parque Jur├ísico                                      |              16
 El show de Truman                                     |              17
 Full Metal Jacket                                     |              17
 Los cazafantasmas                                     |              17
 Regreso al futuro                                     |              17
 American History X                                    |              18
 Mejor... imposible                                    |              18
 El caballero oscuro                                   |              19
 El club de la pelea                                   |              19
 El precio del poder                                   |              19
 El viaje de Chihiro                                   |              19
 Uno de los nuestros                                   |              19
 Eduardo Manostijeras                                  |              20
 El libro de la selva                                  |              20
 El Padrino. Parte II                                  |              20
 Regreso al futuro II                                  |              20
 El Padrino. Parte III                                 |              21
 La lista de Schindler                                 |              21
 El Laberinto del Fauno                                |              22
 Salvar al soldado Ryan                                |              22
 El planeta de los simios                              |              24
 El bueno el feo y el malo                             |              25
 En busca del arca perdida                             |              25
 Entrevista con el vampiro                             |              25
 Lo que el viento se llev├│                            |              26
 Pesadilla antes de navidad                            |              26
 El silencio de los corderos                           |              27
 Terminator 2: el juicio final                         |              29
 Blancanieves y los siete enanitos                     |              33
 Indiana Jones y el templo maldito                     |              33
 Indiana Jones y la ├║ltima cruzada                    |              34
 Alguien vol├│ sobre el nido del cuco                  |              36
 Harry Potter y el Prisionero de Azkaban               |              39
 El Se├▒or de los anillos: Las dos torres              |              40
 Star Wars. Episodio I: La amenaza fantasma            |              42
 Star Wars. Episodio IV: Una nueva esperanza           |              43
 Star Wars. Episodio VI: El retorno del Jedi           |              43
 El Se├▒or de los anillos: El retorno del rey          |              44
 Star Wars. Episodio V: El imperio contraataca         |              45
 Piratas del Caribe: El cofre del hombre muerto        |              46
 Star Wars. Episodio III: La venganza de los Sith      |              48
 El Se├▒or de los anillos: La comunidad del anillo     |              49
 Piratas del Caribe: La maldici├│n de la Perla Negra   |              51
 Sweeney Todd: El barbero diab├│lico de la calle Fleet |              53
(100 filas)


peliculas=#

--Req.8. consultar cual es la longitud más grande entre todos los titulos de las peliculas

peliculas=# SELECT MAX(LENGTH(nombre_pelicula)) AS longitud_titulo FROM peliculas;
 longitud_titulo
-----------------
              53
(1 fila)


























































































