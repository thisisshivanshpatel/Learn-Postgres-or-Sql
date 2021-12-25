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

```SQL
SELECT * FROM people
WHERE id >=4 AND id <=10;
```


## Authors
- [@thisisshivanshpatel](https://www.github.com/thisisshivanshpatel)