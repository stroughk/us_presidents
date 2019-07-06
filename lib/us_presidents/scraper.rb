class UsPresidents::Scraper 
  
  def self.scrape_presidents(url)
    site = "https://millercenter.org/president"  
    webpage = Nokogiri::HTML(open(site))
    section = webpage.css("div.info-wrapper a")
   end  
  
  
  #scraping url information ?????
  #def self.scrape_url(url)
   # site = "https://millercenter.org/president"  
    #webpage = Nokogiri::HTML(open(site))
    #url = webpage.css(".field-content a")[0]['href']
    #full_link = "https://millercenter.org"+url
    #puts full_link
  #end
end