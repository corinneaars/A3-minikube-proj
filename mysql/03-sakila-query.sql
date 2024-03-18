SELECT first_name, last_name, email, country.country, city.city
FROM customer
LEFT JOIN address ON address.address_id=customer.address_id
LEFT JOIN city ON city.city_id=address.city_id
LEFT JOIN country ON city.country_id=country.country_id
WHERE country.country="Canada"
ORDER BY city.city;