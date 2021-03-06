class UsPresidents::Scraper 
    
    def self.scrape_articles 
      doc = Nokogiri::HTML(open("https://millercenter.org/president"))
      doc.search(".info-wrapper").each do |article_li|
      story = UsPresidents::Story.new 
        
      story.url = article_li.search(".field-content a").attr("href").text
      story.name = article_li.search(".field-content a").text
      story.inaguration = article_li.search(".views-field--inauguration-date").text
      story.end_date = article_li.search(".views-field--date-ended").text
      
      story.save
    end
  end  
      
    def self.scrape_additional_details(story)
      full_link = "https://millercenter.org#{story.url}"  
      doc = Nokogiri::HTML(open(full_link))
      full_content = doc.search(".copy-wrapper p").text
      story.additional_details = full_content
    end
end