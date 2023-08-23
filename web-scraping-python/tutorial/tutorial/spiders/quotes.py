import scrapy
from scrapy.loader import ItemLoader
from tutorial.items import QuoteItem


class QuotesSpider(scrapy.Spider):
    name = "quotes"
    allowed_domains = ["quotes.toscrape.com"]
    start_urls = ["http://quotes.toscrape.com/"]

    def parse(self, response):
        self.logger.info(" ^_^ Parse function called on %s", response.url)
        quotes = response.css("div.quote")
        for quote in quotes:
            loader = ItemLoader(item=QuoteItem(), selector=quote)
            loader.add_css("quote_content", "span.text::text")
            loader.add_css("tags", "div.tags a::text")
            quote_item = loader.load_item()
            # parser author page
            author_url = quote.css("span > a::attr(href)").extract_first()
            yield response.follow(author_url, callback=self.parse_author, meta={'quote_item': quote_item})
        
        # go to next page
        for a in response.css("li.next a"):
            yield response.follow(a, callback=self.parse)

    
    def parse_author(self, response):
        # yield {
        #     'author_name': response.css('div.author-details > h3.author-title::text').extract_first(),
        #     'author_birthday': response.css('span.author-born-date::text').extract_first(),
        #     'author_bornlocation': response.css('span.author-born-location::text').extract_first(),
        #     'author_bio': response.css('div.author-description::text').extract_first(),
        # }
        quote_item = response.meta['quote_item']
        loader = ItemLoader(item=quote_item, response=response)
        loader.add_css("author_name", "div.author-details > h3.author-title::text")
        loader.add_css("author_birthday", "span.author-born-date::text")
        loader.add_css("author_bornlocation", "span.author-born-location::text")
        loader.add_css("author_bio", "div.author-description::text")
        yield loader.load_item()
