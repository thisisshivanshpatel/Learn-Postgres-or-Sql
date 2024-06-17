<img src="postgreslogo.png" alt="postgres logo" width="250"/>

### Creating a Database
``` SQL
CREATE DATABASE dbname
```

- \l => list all the available databases <b>(psql)</b>
=>To create a new database

- \c dbname =>connect to the database <b>(psql)</b>
- \i filepath =>To execute a specific sql file

### Deleting a database

```SQL
DROP DATABASE 
```
=> To delete the database

### Creating a table

```SQL
CREATE TABLE table-name
```
=> To create a table

### syntax:- 
``` SQL 
CREATE TABLE person(
id BIGSERIAL NOT NULL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
gender VARCHAR(15) NOT NULL,
dob DATE NOT NULL,
email VARCHAR(120) );
```

### Auto incrementing columns

In PostgreSQL, you can add an auto-increment column to a new table using the `SERIAL` pseudo-type:

**Syntax**:- 
``` SQL
CREATE TABLE table_name(id SERIAL)
```

**Explanation**: `SERIAL` is shorthand for creating an auto-incrementing, unique identifier column. When you use SERIAL, PostgreSQL creates a sequence object, sets the next value from the sequence as the column's default value, and adds a NOT NULL constraint to the column. This is because sequences always generate integers, which are non-null values. 

**UUID**:
You can also use the `uuid_generate_v4` function from the `uuid-ossp` extension to generate universally unique identifiers (UUIDs). UUIDs are 128-bit numbers that are very unlikely to be duplicated

you need to install the extension in each database where you are going to use it:

``` SQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```
- \d =>To list the tables(relations) <b>(psql)</b>

- \d tablename=>To view table details <b>(psql)</b>

### Inserting data into the table

```SQL
INSERT INTO tablename(col_name,..) VALUES('value')
```

###  syntax:-

```SQL
INSERT INTO person(name,gender,dob,email)
VALUES ('shivansh patel','MALE','1999-10-02','shivanshpatel.1999@gmail.com');
```

### Deleting a table

```SQL
DROP TABLE table name
```
=>To DROP a specific table

### Selecting from a table

```SQL
SELECT * FROM table_name;
``` 
=>to view all the rows and column

``` SQL
SELECT column_name FROM table_name; 
```
=>to view only specific column

### Listing Databases
``` SQL
SHOW DATABASES
```
=>To list all the databases

### Listing Tables
``` SQL
SHOW TABLES
```
=>To list all the tables

``` SQL
SHOW COLUMNS FROM tablename
```
=>To view the list of all columns from a specific table

### DISTINCT
- The SQL DISTINCT keyword is used in conjunction with select to eliminate all duplicate records and return only unique ones

``` SQL
SELECT DISTINCT column_name1,column_name2
FROM table_name
```

### LIMIT
- Use to limit the number of records

``` SQL
SELECT column_names
FROM table_name
LIMIT [number of records]
```

### OFFSET
- You can also pickup the set of records from a particular OFFSET

``` SQL
SELECT column_names
FROM table_name
OFFSET [position]
LIMIT [number of records]
```
### FETCH
- **FETCH** is the official way to limit the number of rows

``` SQL
SELECT * FROM person OFFSET 5 FETCH FIRST 10 ROW ONLY;
```

### ORDER BY
-  We can use order by to sort data based on sigle or multiple column by default it sorts in ASCENDING ORDER

```SQL
SELECT * FROM CUSTOMERS
ORDER BY ID,AGE [ASC,DESCENDING];
```

### chain commands

``` SQL
SELECT DISTINCT country_of_birth from people
ORDER BY country_of_birth
LIMIT 10;
```

### GROUP BY

- used for grouping

```SQL
SELECT country_of_birth,COUNT(*) FROM people
GROUP BY country_of_birth
ORDER BY country_of_birth;
```

country_of_birth|count
----------------|-----
 Afghanistan    | 8
 Albania        |2
 Angola         |1
 Argentina      |9

### HAVING

- used for filtering

```SQL
SELECT country_of_birth,COUNT(*) FROM people
GROUP BY country_of_birth
HAVING COUNT(*)>12
ORDER BY country_of_birth;
```

 country_of_birth | count
------------------|-------
 Brazil           |    22
 China            |   135
 Indonesia        |    76
 Japan            |    22
 Philippines      |    36
 Poland           |    20

### WHERE
- The where clause is used to retrieve only those records that fulfill a specified criterion

``` SQL
SELECT column_list
FROM table_name
WHERE condition;
```

#### e.g:-
``` SQL
SELECT * FROM people
WHERE id=10;
```

### BETWEEN
- The Between operator selects values with in a range.The first value must be lower bound and the second value the upper bound 

``` SQL
SELECT * FROM people
WHERE id BETWEEN 3 AND 7;
```

### LOGICAL OPERATOR [AND,OR,IN,NOT]

- Logical operator can be used to combine two boolean values and return a result of true,false or null

#### AND
```SQL
SELECT * FROM people
WHERE id >=4 AND id <=10;
```

#### OR

```SQL
SELECT * FROM people
WHERE country_of_birth='India' OR country_of_birth='Usa';
```

 |id  | first_name | last_name | gender|country_of_birth
|----|------------|-----------|--------|-
 136 | shivansh    | patel     | male |India
 934 | Joell      | Wickwar   | Female |Usa


### combining Add & OR

```SQL
SELECT * FROM PEOPLE
WHERE country_of_birth='India'
AND (id=133 OR id=934);
```

 |id  | first_name | last_name | gender|country_of_birth
|----|------------|-----------|--------|-
 133 | Jehanna    | Coate     | Female |India
 934 | Joell      | Wickwar   | Female |India

### IN

- **IN** operator is used when you want to compare a column with more than one value

```SQL
SELECT * FROM people
WHERE country_of_birth IN('China','Israel','Malaysia');
```

### NOT IN

- **NOT IN** operator allows you to exclude a list of specific values from the result set


```SQL
SELECT * FROM people
WHERE country_of_birth NOT IN('China','Israel','Malaysia');
```

### Concat Function
- **concat** function is used to concatenate two or more text values and returns the concatenating string

```SQL
 SELECT CONCAT(first_name,' ',last_name) FROM people;
```

### AS KEYWORD

- **AS** keyword is used to assign custom name to the the column 

```SQL
SELECT CONCAT(first_name,' ',last_name) AS Name FROM people;
```

name|
--------------------
 Carolina Draycott  |
 Mendie Lethebridge |
 Minda Philipsen    |
 Tresa Drewe        |
 Jill Lyosik        |

### Arithmetic operators
- we can also use Arithmetic operators to perform Arithmetic operations(+,-,*,/) on any column

```SQL
SELECT id + 10 AS ID,first_name FROM people
LIMIT 10;
```

 id | first_name
----|------------
 11 | Carolina
 12 | Mendie
 13 | Minda
 14 | Tresa
 15 | Jill
 16 | Daisy
 17 | Robinet
 18 | Langston
 19 | Augustina
 20 | Meier

### UPER FUNCTION AND LOWER FUNCTION
- **UPPER** function converts all letters in the specified string to uppercase 

- **LOWER** function converts all letters in the specified string to lowercase 

```SQL
SELECT UPPER(first_name) AS FIRST_NAME,last_name
FROM people
LIMIT 5;
```

 first_name |  last_name
------------|-------------
 CAROLINA   | Draycott
 MENDIE     | Lethebridge
 MINDA      | Philipsen
 TRESA      | Drewe
 JILL       | Lyosik

### SQRT,AVG,SUM,MIN FUNCTIONS
- **SQRT** function return the square root of given value in the argument
- **AVG** function return the Average of given value in the argument

```SQL
 SELECT AVG(price) from car;
```
|         avg      |  
|------------------|
|507730.73883000000|

- **ROUND** function rounds the given value

```SQL
SELECT ROUND(AVG(price)) from car;
```

| round |
|-------|
| 507731|
- **SUM** function return the sum of given value in the argument
- **MIN** function return the MINIMUM

```SQL
 SELECT model,MIN(price) FROM car GROUP BY model;
```
|         model          |    min
-------------------------|-----------
 300E                    | 851838.83
 Suburban 2500           |  94046.29
 Regal                   |  37935.14
 Grand Am                | 335841.12
 Patriot                 | 598906.50
 G5                      | 283470.80
 Econoline E150          | 780674.94
 Sportvan G20            | 217390.31

- **Max** function returns the Maximum 

```SQL
SELECT MAX(price) from car;
```

### COALESCE
- Return the first non-null value in a list

```SQL
SELECT COALESCE(email,'email not provided') FROM people;
```
|              coalesce             |
------------------------------------|
 cdraycott0@privacy.gov.au          |
  email not provided                |
 mphilipsen2@reverbnation.com       |
 email not provided                 |
 jlyosik4@livejournal.com           |
 dbunhill5@zdnet.com                |


### NULLIF

- The **NULLIF()** function returns NULL if two expressions are equal, otherwise it returns the first expression.

```SQL
SELECT 10/NULLIF(2,9) AS divide;
```

| divide|
--------|
  5     |

```SQL
SELECT 10/NULLIF(0,0) AS divide;
```
|divide|
-------|
  .    |

### Subqueries
- A subquery is a query within another query

```SQL
SELECT first_name,salary FROM employees
WHERE salary>(SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;
```

### Like operator
- The **Like** keyword is useful when specifying a search condition within your WHERE clause
- **Like** keyword is case sensitive
- if you use the % sign before any specific letter it will return the result ending with that letter

- if you use the % sign After any specific letter it will return the result starting with that letter

```SQL
SELECT * FROM people
WHERE first_name LIKE 'A%';
```
```SQL
SELECT * FROM people
WHERE email LIKE '%@gmail.com';
```
 id  | first_name |        email
-----|------------|---------------------
 205 | Anton      | aolivo5o@google.com


```SQL
SELECT * FROM people
WHERE email LIKE '%@google.%';
```
 id  | first_name |           email
-----|------------|---------------------------
 156 | Tommie     | tbrunner4b@google.co.jp
 169 | Dwight     | dsaywood4o@google.com.au
 190 | Reese      | rpudney59@google.es
 205 | Anton      | aolivo5o@google.com
 213 | Chelsie    | ckemm5w@google.de
 488 | Josey      | jfawlodj@google.co.jp
 533 | Farand     | fastmanes@google.es
 677 | Rustie     | rteeceis@google.ru
 701 | Christen   | csturzakerjg@google.it
 895 | Etti       | ewhittletonou@google.nl
 961 | Lacey      | lhandlinqo@google.co.uk

- This one 👆 is used to match only center characters

```SQL
SELECT * FROM people
WHERE email LIKE '______@%';
```
- - This one 👆 is used to match only single characters

### ILIKE
- **ILIKE** keyword basically ignores the cases 

```SQL
SELECT * FROM people
WHERE country ILIKE '%p';
```

### FOREIGN KEY

- A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

- The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.

```SQL
create table people (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	email VARCHAR(50),
	date_of_birth DATE,
	country_of_birth VARCHAR(50),
    car_id BIGINT REFERENCES car (id),
    UNIQUE(car_id)
);
```
- The following SQL creates a FOREIGN KEY on the "car_id" column when the "people" table is created

### joins

- To join the two tables,specify them as a comma-separated list in the FROM clause

```SQL
SELECT customer.id,customer.name,orders.name,orders.amount
From customer,orders
WHERE customer.id=orders.customer_id
ORDER BY customer.id;
```

 id |      name      |     name      | amount
----|----------------|---------------|--------
  1 | shivansh patel | Gaming Laptop |  55000
  2 | Anurag patel   | Books         |   1500
  3 | Gaurav singh   | play station  |  50000
  4 | Piyush Kumar   | Bag           |   1800
  5 | Ajay parab     | SmartPhone    |  20000

#### INNER JOIN
- **INNER JOIN** is equivalent to join.it returns rows when there is a match between the tables

```SQL
SELECT customer.id,customer.name,orders.name,orders.amount
From customer INNER JOIN orders
ON customer.id=orders.customer_id
ORDER BY customer.id;
```
#### LEFT JOIN
- **LEFT JOIN** returns all rows from the left table,even if there are no matches in the right table

```SQL
SELECT customer.id,customer.name,orders.name,orders.amount
From customer LEFT OUTER JOIN orders
ON customer.id=orders.customer_id
ORDER BY customer.id;
```

#### RIGHT JOIN
- **RIGHT JOIN** returns all rows from the right table,even if there are no matches in the left table

- **OUTER** keyword is optional and can be omitted
```SQL
SELECT customer.id,customer.name,orders.name,orders.amount
From customer RIGHT OUTER JOIN orders
ON customer.id=orders.customer_id
ORDER BY customer.id;
```

### UNION
- The **UNION** operator is used to combine the result-set of two or more SELECT statements
- It remove all the duplicate records
- All select statements with in the UNION must have the same number of columns.The columns must also have the same data types.Also the columns in each SELECT statement must be in the same order

#### syntax:-

```SQL
SELECT column_name(s) FROM TABLE1
UNION
SELECT column_name(s) FROM TABLE2
```

### UNION ALL
- **UNION ALL** selects all rows from each table and combines them into a single table
- It did'nt remove duplicate records
 - **UNION ALL** is faster than UNION,as it does not remove the duplicate records

```SQL
SELECT column_name(s) FROM TABLE1
UNION ALL
SELECT column_name(s) FROM TABLE2
```

### UPDATE 
- **UPDATE** statement allows us to update data in the table

#### syntax:-
```SQL
UPDATE table_name
SET column1=value1,column2=value2,..
WHERE ID=5;
```

```SQL
UPDATE orders
SET amount=37000
WHERE ID=5;
```
### DELETE
- **DELETE** statement is used to delete specific data from your table
- if you omit the where clause all records in the table will be deleted

#### syntax:-
```SQL
DELETE FROM table_name
WHERE condition
```

```SQL
DELETE FROM Employees
WHERE ID=1;
```

### ALTER TABLE

#### Adding new column

```SQL
 ALTER TABLE customer ADD Number_of_purchase int;
```

#### Renaming a column

```SQL
ALTER TABLE customer
RENAME number_of_purchase TO purchase;
```

### Changing DataType of the column

```SQL
ALTER TABLE table_name ALTER COLUMN column_name TYPE new_data_type
```

### Renaming a Table

```SQL
RENAME TABLE people TO Users;
```

#### Dropping a column

```SQL
ALTER TABLE customer
DROP COLUMN purchase;
```

### Views
- A view is a named query that provides another way to present data in the database tables. A view is defined based on one or more tables which are known as base tables. When you create a view, you basically create a query and assign a name to the query. Therefore, a view is useful for wrapping a commonly used complex query.
- in SQL, a view is a Virtual table that is based on the result-set of an SQL statement

#### syntax:-
```SQL
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition
```

```SQL
CREATE VIEW pay AS
SELECT customer_id,amount
FROM orders;
```
- **view** always shows up-to-date data

#### Updating a View



#### Dropping a view

```SQL
DROP VIEW pay;
```
## Authors
- [@thisisshivanshpatel](https://www.github.com/thisisshivanshpatel)