class UsPresidents::Scraper 
    def initialize(url = nil)
      @url = url 
    end 
  
    def self.scrape_presidents
      site = "https://millercenter.org/president"  
      webpage = Nokogiri::HTML(open(site))
      section = webpage.css("div.info-wrapper a")
    end  

    def self.scrape_url 
      site = "https://millercenter.org/president"  
      webpage = Nokogiri::HTML(open(site))
      full_url = "https://millercenter.org" + (webpage.search(".field-content a").attr("href"))
    end

    def self.scrape_story
      site = "https://millercenter.org/president/clinton"  
      webpage = Nokogiri::HTML(open(site))
      story = webpage.css(".copy-wrapper").css('p').text
    end
end