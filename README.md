- \l => list all the available databases <b>(psql)</b>


``` SQL
CREATE DATABASE dbname
```
=>To create a new database

- \c dbname =>connect to the database <b>(psql)</b>

```SQL
DROP DATABASE 
```
=> To delete the database

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

- \d =>To list the tables(relations) <b>(psql)</b>

- \d tablename=>To view table details <b>(psql)</b>

```SQL
DROP TABLE table name
```
=>To DROP a specific table

```SQL
INSERT INTO tablename(col_name,..) VALUES('value')
```

###  syntax:-

```SQL
INSERT INTO person(name,gender,dob,email)
VALUES ('shivansh patel','MALE','1999-10-02','shivanshpatel.1999@gmail.com');
```
```SQL
SELECT * FROM table_name;
``` 
=>to view all the rows and column

``` SQL
SELECT column_name FROM table_name; 
```
=>to view only specific column

``` SQL
SHOW DATABASES
```
=>To list all the databases

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
 Carolina Draycott
 Mendie Lethebridge
 Minda Philipsen
 Tresa Drewe
 Jill Lyosik

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
- **SUM** function return the sum of given value in the argument
- **MIN** function return the MINIMUM of given value in the argument

### Subqueries
- A subquery is a query within another query

```SQL
SELECT first_name,salary FROM employees
WHERE salary>(SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;
```

### Like operator
- The Like keyword is useful when specifying a search condition within your WHERE clause

- if you use the % sign before any specific letter it will return the result ending with that letter

- if you use the % sign After any specific letter it will return the result starting with that letter

```SQL
SELECT * FROM people
WHERE first_name LIKE 'A%';
```

## Authors
- [@thisisshivanshpatel](https://www.github.com/thisisshivanshpatel)