# I will be writing queries for the Sakila database that can be found in MySQL 8.0.35.

# Below is an inner join that will display the first and last name of each customer along with their email that rented the film "ACE GOLDFINGER". A total of four tables will be used.

SELECT c.first_name, c.last_name, c.email
FROM customer c 
	INNER JOIN rental r
    	ON c.customer_id = r.customer_id
    	INNER JOIN inventory i 
    	ON i.inventory_id = r.inventory_id
    	INNER JOIN film_text f
    	ON f.film_id = i.film_id
WHERE f.title = 'ACE GOLDFINGER';


# Below is a subquery that uses an inner join, inside a containing query to select all film titles that fall under the category of "ACTION".

SELECT title
FROM film 
WHERE film_id IN 
(SELECT fc.film_id
FROM film_category fc
	INNER JOIN category c 
	ON c.category_id = fc.category_id
	WHERE c.name = 'ACTION');


# Below is an outer join which will display in the output each films' title and id regardless of whether it was rented by any customer or not
# as there will be some NULL values in the first_name and last_name columns for films that were never rented by any customer.

SELECT f.film_id, f.title, c.first_name, c.last_name
FROM film f 
	LEFT OUTER JOIN inventory i 
    	ON i.film_id = f.film_id
    	LEFT OUTER JOIN rental r
    	ON r.inventory_id = i.inventory_id
    	LEFT OUTER JOIN customer c
	ON c.customer_id = r.customer_id;
