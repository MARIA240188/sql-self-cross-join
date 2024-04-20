USE sakila;
-- Consigue todos los pares de actores que trabajaron juntos.
SELECT DISTINCT

    c1.customer_id AS customer1_id,

    c1.first_name AS customer1_first_name,

    c1.last_name AS customer1_last_name,

    c2.customer_id AS customer2_id,

    c2.first_name AS customer2_first_name,

    c2.last_name AS customer2_last_name,

    i.film_id

FROM

    rental r1

JOIN

    rental r2 ON r1.inventory_id = r2.inventory_id AND r1.customer_id < r2.customer_id

JOIN

    customer c1 ON r1.customer_id = c1.customer_id

JOIN

    customer c2 ON r2.customer_id = c2.customer_id

JOIN

    inventory i ON r1.inventory_id = i.inventory_id

GROUP BY

    c1.customer_id, c2.customer_id, i.film_id

HAVING

    COUNT(*) > 3

ORDER BY

    c1.customer_id, c2.customer_id, i.film_id;
-- Consigue todas las parejas posibles de actores y películas.

SELECT 

  a.actor_id, 

  a.first_name, 

  a.last_name, 

  f.film_id, 

  f.title

FROM 

  sakila.actor a

CROSS JOIN 

  sakila.film f;