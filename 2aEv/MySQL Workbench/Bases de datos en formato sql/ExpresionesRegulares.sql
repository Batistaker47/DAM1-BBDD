#-----------------------------CONSULTAS CON EXPRESIONES REGULARES-----------------------------------
# REGEXP --> 'REGULAR EXPRESSION', ES IGUAL QUE EL LIKE PERO MUCHO MÁS POTENTE
USE sakila;
#------------------------ QUE CONTENGAN.........-----------------------------
SELECT * FROM actor order by first_name;
	#Esta búsqueda sacaría los resultados que contengan 'la' en cualquier posición.
SELECT * FROM actor 
WHERE
	first_name REGEXP 'la';
    #first_name LIKE '%la%'

	# Que contenga R o A en cualquier posicion.
SELECT * FROM actor 
WHERE
	first_name REGEXP '[RA]';
    
    # Que no contenga R o A en cualquier posicion.
SELECT * FROM actor 
WHERE
	first_name NOT REGEXP '[RA]';

	# Que contenga RA o RE en cualquier posicion.
SELECT * FROM actor 
WHERE
	first_name REGEXP 'RA|RE';
    
    # Que contenga DA, BER o NI en cualquier posicion.
SELECT * FROM actor 
WHERE
	first_name REGEXP 'DA|BER|NI';
    
     # Que contenga una estructura que empiece por una letra + cualquier cosa + letra
     # Ejemplo: empiece la estructura por a + cualquier cosa + otra a
SELECT * FROM actor 
WHERE
	first_name REGEXP 'a.a';
    
     # Que contenga una estructura que empiece por una letra + cualquier cosa, cualquier cosa + letra
     # Ejemplo: empiece la estructura por a + cualquier cosa, cualquier cosa + otra a
SELECT * FROM actor 
WHERE
	first_name REGEXP 'a..a';
    
     # Que acabe en a + cualquier letra
SELECT * FROM actor 
WHERE
	first_name REGEXP 'a.$';
 #--------------COMIENZOS-------------------------------   
	# Que comience por R 
SELECT * FROM actor 
WHERE
	first_name REGEXP '^R';
    
    # Que comience por R o W
SELECT * FROM actor 
WHERE
	first_name REGEXP '^[RW]';
#--------------TERMINACIONES-------------------------------
     # Que acabe por R
SELECT * FROM actor 
WHERE
	first_name REGEXP 'R$';
    
	# Que acabe por R o por A
SELECT * FROM actor 
WHERE
	first_name REGEXP '[RA]$';