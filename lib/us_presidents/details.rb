class UsPresidents::Details
  attr_accessor :story
  @@all = [] 
  
  def self.all 
    @@all 
  end 
  
  def content 
    @content ||= UsPresidents::Scraper.new(url).scrape_presidents
  end 
  
  def save 
    @@all << self 
  end 
end