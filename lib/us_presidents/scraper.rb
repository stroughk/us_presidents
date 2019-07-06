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
      site = "https://millercenter.org/president"    #enter your site to test here
      page = Nokogiri::HTML(open(site))
      title = page.css("div.info-wrapper a")
    @href = []
      title.each do |a| 
     @href << a.attr("href")
      puts @href
      end
    end

    def self.scrape_story
      site = "https://millercenter.org/president/clinton"  
      webpage = Nokogiri::HTML(open(site))
      story = webpage.css(".copy-wrapper").css('p').text
    end
end