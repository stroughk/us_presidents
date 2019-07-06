class UsPresidents::Scraper 
  def initialize(url = nil)
    @url = url 
  end 
  
    def self.scrape_presidents
      site = "https://millercenter.org/president"  
      webpage = Nokogiri::HTML(open(site))
      section = webpage.css("div.info-wrapper a")
    end  

    def scrape_presidents
      site = "https://millercenter.org/president/washington"  
      webpage = Nokogiri::HTML(open(site))
      
      puts birth_date = webpage.css(".data.date-data").css("time").first.text
      puts death_date = webpage.css(".data.date-data").css("time")[1].text
      puts religion = webpage.css(".data.string-data").css("div")[5].text
      puts political_party = webpage.css(".data.string-data").css("div")[9].text
      puts nickname = webpage.css(".data.string-data").css("div")[11].text

    end

  
  end