class UsPresidents::Scraper 
  
  def self.scrape_presidents(url)
    site = "https://millercenter.org/president"  
    webpage = Nokogiri::HTML(open(site))
    section = webpage.css("div.info-wrapper a")
   end  
  
  def self.scrape_url 
    site = "https://millercenter.org/president"  
    webpage = Nokogiri::HTML(open(site))
    url = webpage.search(".field-content a").first.attr("href")
    puts url
  end
  
  def self.details 
    site = "https://millercenter.org/president"  
    webpage = Nokogiri::HTML(open(site))
    
    birth_date = webpage.css(".data.date-data").css("time").first.text
    death_date = webpage.css(".data.date-data").css("time")[1].text
    religion = webpage.css(".data.string-data").css("div")[5].text
    political_party = webpage.css(".data.string-data").css("div")[9].text
    nickname = webpage.css(".data.string-data").css("div")[11].text
  end
    
  
  
end