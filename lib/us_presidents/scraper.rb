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
end