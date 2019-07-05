class UsPresidents::CLI 
  
  def start 
   greeting
   list_presidents
   user_choice
   details
   goodbye
  end
  
  
  def greeting
    puts "\nWelcome! Please see a list of US Presidents.\n"
    puts "\nPlease type a number associated with a president you would like to learn more.\n"
    
  end
  
  def list_presidents 
    url = "https://millercenter.org/president"
    UsPresidents::Scraper.scrape_presidents(url)
     UsPresidents::Scraper.scrape_url(url)
    #scrape names with index
  
  end
  
  def user_choice 
    input = gets.strip.to_i
  end
  
  def details 
    #display the information about the president the user selected
  end
  
  def goodbye 
    #puts "Goodbye!"
  end
  
end