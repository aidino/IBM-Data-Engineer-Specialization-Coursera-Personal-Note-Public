SELECT COUNT(Attribute) - COUNT(DISTINCT Attribute) FROM table_name;

SELECT CITY, LENGTH(CITY) AS NameLength
FROM STATION
ORDER BY NameLength DESC, CITY ASC
LIMIT 1;

SELECT CITY, LENGTH(CITY) AS NameLength
FROM STATION
ORDER BY NameLength ASC, CITY ASC
LIMIT 1;

SELECT CITY from STATION WHERE LOWER(SUBSTRING(CITY, 1, 1)) IN ('u','e','o','a','i')

SELECT DISTINCT CITY 
FROM STATION 
WHERE LOWER(SUBSTRING(CITY, 1, 1)) NOT IN ('u','e','o','a','i') 
AND LOWER(SUBSTRING(CITY, -1, 1)) NOT IN ('u','e','o','a','i')

select sum(POPULATION)
from CITY
WHERE DISTRICT = 'California'

SELECT CEIL(AVG(SALARY) - AVG(CAST(REPLACE(CAST(SALARY AS CHAR), '0', '') as DECIMAL))) FROM EMPLOYEES



#!pip install psycopg2-binary
import psycopg2

POSTGRES_DB_HOST = "192.168.24.254"
POSTGRES_DB_PORT = "5432"

conn = psycopg2.connect(host=POSTGRES_DB_HOST, 
                        port=POSTGRES_DB_PORT,
                        database="testdb",
                        user="admin", 
                        password="admin")