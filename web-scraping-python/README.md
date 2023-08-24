**References**: 
- https://towardsdatascience.com/a-minimalist-end-to-end-scrapy-tutorial-part-i-11e350bcdec0
- https://github.com/harrywang/scrapy-selenium-demo
- https://towardsdatascience.com/web-scraping-with-scrapy-theoretical-understanding-f8639a25d9cd

**Scrapy**

- Analyze the response, i.e., the HTML page at http://quotes.toscrape.com using Scrapy Shell by running 

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

**Selenium**

- ChromeDriver: https://sites.google.com/a/chromium.org/chromedriver/
- move chromedriver to `/usr/local/bin/`
```bash
sudo mv chromedriver /usr/local/bin/
```
