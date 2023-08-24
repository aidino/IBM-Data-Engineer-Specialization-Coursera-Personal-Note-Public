# Scrapy tutorials

Source: https://scrapeops.io/python-scrapy-playbook/

## Scrapy For Beginners Series

### Part 1: How To Build Your First Scrapy Spider

- Install **scrapy**

```bash
pip install scrapy
```

- Setup Our Scrapy Project

```bash
scrapy startproject <project_name>
# scrapy startproject chocolatescraper

cd <project_name>
# cd chocolatescraper

scrapy genspider <spider_name> <domain_name>
# scrapy genspider chocolatespider chocolate.co.uk

```

- Scrapy Shell: Finding Our CSS Selectors

```bash
scrapy shell

# In scrapy shell: Fetch The Page
fetch('https://www.chocolate.co.uk/collections/all')

# In scrapy shell: Inspect The Response
response.css('product-item').get()
```

-  Running Our Spider

```bash
scrapy crawl <spider_name>
# scrapy crawl chocolatespider

# Save the output to a json file
scrapy crawl <spider_name> -o <output_file_name>
# scrapy crawl chocolatespider -o chocolate.json

# Save the output to a csv file
scrapy crawl <spider_name> -o <output_file_name>
# scrapy crawl chocolatespider -o chocolate.csv

```

### Part 2: Cleaning Dirty Data & Dealing With Edge Cases

### Part 3: Storing Data With Scrapy

- Saving in JSON format

```bash
scrapy crawl chocolatespider -o my_scraped_chocolate_data.json
```

You can also define an absolute path like this:

```bash
scrapy crawl chocolatespider -O file:///path/to/my/project/my_scraped_chocolate_data.json:json
```

- Saving in CSV format

```bash
scrapy crawl chocolatespider -o my_scraped_chocolate_data.csv
```

You can also define an absolute path like this:

```bash
scrapy crawl chocolatespider -O file:///path/to/my/project/my_scraped_chocolate_data.csv:csv
```

- Saving Data to Amazon S3 Storage

```bash
pip3 install botocore
scrapy crawl chocolatespider -O s3://aws_key:aws_secret@mybucket/path/to/myscrapeddata.csv:csv
```

You can also save the `aws_key` & `aws_secret` in your project settings file:

```bash
AWS_ACCESS_KEY_ID = 'myaccesskeyhere'
AWS_SECRET_ACCESS_KEY = 'mysecretkeyhere'
```

- Saving Data to MySQL and PostgreSQL Databases
    - [MySQL](https://scrapeops.io/python-scrapy-playbook/scrapy-beginners-guide-storing-data/#saving-data-to-a-mysql-database)
    - [PostgreSQL](https://scrapeops.io/python-scrapy-playbook/scrapy-beginners-guide-storing-data/#saving-data-to-a-postgresql-database)

PostgreSQL:

```bash
pip3 install psycopg2-binary

# connect to the database
psql -h localhost -U postgres -W -p 5432

# list all databases
\l

# connect to a database
\c <database_name>

# list all tables
\dt

# list all columns in a table
\d <table_name>

# quit
\q

# create a database if it doesn't exist
CREATE DATABASE <database_name>;

# create a table
CREATE TABLE <table_name> (
    <column_name> <data_type> <constraints>
);

CREATE TABLE IF NOT EXISTS chocolate_products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    price VARCHAR(255),
    url TEXT
    );

```

