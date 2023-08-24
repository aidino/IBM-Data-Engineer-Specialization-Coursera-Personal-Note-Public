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
```