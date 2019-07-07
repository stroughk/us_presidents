class UsPresidents::Scraper 
    
    def scrape_articles 
      # for each president on the homepage
      # get the article's data 
      # instantiate a story based on that data 
      @doc = Nokogiri::HTML(open("https://millercenter.org/president"))
      @doc.search(".info-wrapper").each do |article_li|
        story = UsPresidents::Story.new 
        
        story.url = article_li.search(".field-content a").attr("href")
        story.title = article_li.search(".field-content a").text
        story.inaguration = article_li.search(".views-field--inauguration-date").text
        story.end_date = article_li.search(".views-field--date-ended").text
      
        story.save
      end 
    end

end