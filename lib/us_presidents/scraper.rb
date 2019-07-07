class UsPresidents::Scraper 
    
    def initialize(url = nil)
      @url = url 
    end 
    
    def scrape_article 
      @doc = Nokogiri::HTML(open(@url))
      @doc.search(".info-wrapper").text 
    end
    
    def scrape_articles 
      @doc = Nokogiri::HTML(open("https://millercenter.org/president"))
      @doc.search(".info-wrapper").each do |article_li|
        story = UsPresidents::Story.new 
        
        story.url = article_li.search(".field-content a").attr("href").text
        story.name = article_li.search(".field-content a").text
        story.inaguration = article_li.search(".views-field--inauguration-date").text
        story.end_date = article_li.search(".views-field--date-ended").text
      
        story.save
      end
    end 

    #def scrape_content 
     # @page = Nokogiri::HTML(open("https://millercenter.org#{@url}"))
     # @page.search(".copy-wrapper p").text
     #end


end