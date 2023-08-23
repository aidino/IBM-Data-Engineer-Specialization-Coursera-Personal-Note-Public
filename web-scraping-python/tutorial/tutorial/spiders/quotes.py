import scrapy


class QuotesSpider(scrapy.Spider):
    name = "quotes"
    allowed_domains = ["quotes.toscrape.com"]
    start_urls = ["http://quotes.toscrape.com/"]

    def parse(self, response):
        self.logger.info(" ^_^ Parse function called on %s", response.url)
        quotes = response.css("div.quote")
        for quote in quotes:
            yield {
                "text": quote.css("span.text::text").extract(),
                "author": quote.css("span > small.author::text").extract(),
                "tags": quote.css("div.tags a::text").extract(),
            }

            # parser author page
            author_url = quote.css("span > a::attr(href)").extract_first()
            self.logger.info(" ^_^ author_url: %s", author_url)
            if author_url is not None:
                yield response.follow(author_url, callback=self.parse_author)
        
        # nextPage = response.css("li.next>a::attr(href)").extract_first()
        # if nextPage is not None:
        #     yield response.follow(nextPage, callback=self.parse)

        # follow can automatically handle relative URLs
        for a in response.css("li.next a"):
            yield response.follow(a, callback=self.parse)

    
    def parse_author(self, response):
        yield {
            'author_name': response.css('div.author-details > h3.author-title::text').extract_first(),
            'author_birthday': response.css('span.author-born-date::text').extract_first(),
            'author_bornlocation': response.css('span.author-born-location::text').extract_first(),
            'author_bio': response.css('div.author-description::text').extract_first(),
        }
