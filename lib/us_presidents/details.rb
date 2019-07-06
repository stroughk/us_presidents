class UsPresidents::Details
  attr_accessor :birth_date, :death_date, :religion, :political_party, :nickname
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