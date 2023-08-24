import scrapy
from chocolatescraper.items import ChocolateProduct
from chocolatescraper.itemsloaders import ChocolateProductLoader
from urllib.parse import urlencode
 
# API_KEY = 'aa859a9b-bdc0-44d4-850e-157de8d44f83'

# def get_proxy_url(url):
#     payload = {'api_key': API_KEY, 'url': url}
#     proxy_url = 'https://proxy.scrapeops.io/v1/?' + urlencode(payload)
#     return proxy_url


class ChocolatespiderSpider(scrapy.Spider):
    name = "chocolatespider"
    allowed_domains = ["chocolate.co.uk"]
    # These are the urls that we will start scraping
    def start_requests(self):
        start_url = 'https://www.chocolate.co.uk/collections/all'
        yield scrapy.Request(url=start_url, meta={"proxy": None} ,callback=self.parse)
        # yield scrapy.Request(url=start_url ,callback=self.parse)

    def parse(self, response):
        self.logger.info('^_^ A response from %s just arrived!', response.url)
        #here we are looping through the products and extracting the name, price & url
        products = response.css('product-item')
        for product in products:
            chocolate = ChocolateProductLoader(item=ChocolateProduct(), selector=product)
            chocolate.add_css('name', "a.product-item-meta__title::text")
            chocolate.add_css('price', 'span.price', re='<span class="price">\n              <span class="visually-hidden">Sale price</span>(.*)</span>')
            chocolate.add_css('url', 'div.product-item-meta a::attr(href)')
            yield chocolate.load_item()

        next_page = response.css('[rel="next"] ::attr(href)').get()
        self.logger.info('Next page: %s', next_page)
        if next_page is not None:
        #    next_page_url = 'https://www.chocolate.co.uk' + next_page
           yield response.follow(next_page, meta={"proxy": None}, callback=self.parse)
        #    yield response.follow(next_page, callback=self.parse)