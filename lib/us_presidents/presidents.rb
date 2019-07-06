class UsPresidents::Presidents 
    def self.presidents
      url = "https://millercenter.org/president"
      UsPresidents::Scraper.scrape_presidents(url)
    end
end