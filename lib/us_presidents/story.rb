class UsPresidents::Story
  attr_accessor :name, :inaguration, :end_date, :url, :content, :additional_details
  @@all = [] 
  
  def self.all 
    @@all 
  end 
  
  def content 
    @content ||= UsPresidents::Scraper.new(url).scrape_article  
  end

  def save
    @@all << self
  end 
end