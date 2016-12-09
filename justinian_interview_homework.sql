--NUMBER 1 Write a script that returns a customer name and a product name for every product in the transactions table. (Grover Cleveland throws off the table and makes the historical president numbers not match the customer id. sadpanda)
SELECT customers.customer_name, products.product_name
FROM transactions
JOIN products
ON transactions.product_id=products.product_id
JOIN customers
ON transactions.customer_id=customers.customer_id

--NUMBER 2 Write a script that returns a customer name, class name, and instructor name for every class in the transactions table. (What are boating lessongs?) Also, I'm starting to see a bit of Dan's influence on this database.
SELECT customers.customer_name, classes.class_name, instructors.instructor_name
FROM transactions
JOIN classes
ON transactions.class_id=classes.class_id
JOIN customers
ON transactions.customer_id=customers.customer_id
JOIN instructors
ON classes.instructor_id=instructors.instructor_id

--NUMBER 3 Write a script that returns only the customer name and the total amount of the products each customer purchased.
SELECT customers.customer_name, SUM(products.price) AS Total_Price
FROM transactions
JOIN products
ON transactions.product_id=products.product_id
JOIN customers
ON transactions.customer_id=customers.customer_id
GROUP BY customers.customer_name

--NUMBER 4 Filter question 3 for customers who spent over $50.
SELECT customers.customer_name, SUM(products.price) AS Total_Price
FROM transactions
JOIN products
ON transactions.product_id=products.product_id
JOIN customers
ON transactions.customer_id=customers.customer_id
GROUP BY customers.customer_name
HAVING SUM(products.price) > 50

--NUMBER 5 Update the Volleyball class to start at 12pm on July 4th, 2015 and end at 4pm on July 4th, 2015. (I'm assuming volleyball class is equivalent to the tournament)
UPDATE classes
SET classes.start_time='2015-07-04 12:00:00:000', classes.end_time='2015-07-04 16:00:00:000'
WHERE classes.class_id=4

--NUMBER 6 Write a script to return all customers who have not made a transaction. How you gonna leave Honest Abe
SELECT DISTINCT customers.customer_id, customers.customer_name
FROM customers
WHERE NOT EXISTS (
	SELECT transactions.customer_id
	FROM transactions
	WHERE transactions.customer_id=customers.customer_id
	)

--NUMBER 7 George Bush registered for the Jetski class, but is not showing up on the roster for the Jetski class. Why?
--Because in the transactions table his Class ID is set to 10. There is no such thing. We got some bad data here. If he really registered for jetski, his class id should be 5.

