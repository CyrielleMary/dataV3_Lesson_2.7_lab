USE sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT COUNT(f.film_id), c.category_id
FROM sakila.film_category c
JOIN sakila.film f
ON c.film_id = f.film_id
GROUP BY c.category_id;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT Sum(p.amount), s.staff_id
FROM sakila.staff s
JOIN sakila.payment p
ON s.staff_id = p.staff_id
WHERE DATE_FORMAT(p.payment_date, '%Y-%m') = '2005-08'
GROUP BY s.staff_id;

-- Which actor has appeared in the most films?
SELECT count(f.film_id) as number_of_films, a.actor_id as actor
FROM sakila.film f
JOIN sakila.film_actor a
ON a.film_id=f.film_id
GROUP BY a.actor_id;

-- Most active customer (the customer that has rented the most number of films)
SELECT * FROM rental;

SELECT customer_id as customer, count(rental_id) as number_of_rentals
FROM sakila.rental
GROUP BY customer_id
ORDER BY number_of_rentals DESC;

-- Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
ON s.address_id = a.address_id;


-- List each film and the number of actors who are listed for that film.

SELECT f.title as films, COUNT(a.actor_id) as actors
FROM sakila.film f
JOIN sakila.film_actor a
ON a.film_id=f.film_id
GROUP BY f.title
ORDER BY actors DESC;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, sum(p.amount) AS total_paid
FROM sakila.payment p
JOIN sakila.customer c
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name ASC;

-- List the titles of films per category.
SELECT c.category_id, f.title
FROM sakila.film_category c
JOIN sakila.film f
ON c.film_id = f.film_id
ORDER BY c.category_id ASC;

