class UsPresidents::Scraper 
  
  def self.scrape_presidents(url)
    site = "https://millercenter.org/president"  
    webpage = Nokogiri::HTML(open(site))
    section = webpage.css("div.info-wrapper a")
    array_of_links = section

    array_of_links.each.with_index(1).each do |link, index|
    puts "#{index}. #{link.text}"
    end
  end  
  
  def self.scrape_url(url)
    site = "https://millercenter.org/president"  
    webpage = Nokogiri::HTML(open(site))
    url = webpage.css(".field-content a")[0]['href']
    full_link = "https://millercenter.org"+url
    puts full_link
  end
end