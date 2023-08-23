Reference: https://towardsdatascience.com/a-minimalist-end-to-end-scrapy-tutorial-part-i-11e350bcdec0

- let’s analyze the response, i.e., the HTML page at http://quotes.toscrape.com using Scrapy Shell by running 

```bash
scrapy shell http://quotes.toscrape.com/
```

- run scrapy project

```bash
scrapy crawl quotes
```

- run scrapy project and save to json file

```bash
scrapy crawl quotes -o quotes.json
```

