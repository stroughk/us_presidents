class UsPresidents::CLI 
  
  def start 
   greeting
   list_presidents
   menu
   goodbye
  end
  
  
  def greeting
    puts "\nWelcome! Please see a list of US Presidents.\n\n"
  end
  
  def list_presidents 
    url = "https://millercenter.org/president"
    UsPresidents::Scraper.scrape_presidents(url)
    #UsPresidents::Scraper.scrape_url(url)
    #scrape names with index
  
  end
  
  def menu 
    input = nil 
    while input != "exit"
      puts "\nType the number of the president you would like more information on or type 'list' to list again or  type 'exit' to exit.\n"
      input = gets.strip.downcase
    case input 
      when "1"
        puts "This is information on George Washington"
      when "2"
        puts "This is information on John Adams"
      when "3"
        puts "This is information on Thomas Jefferson"
      when "list"
        list_presidents
      else 
        puts "Not valid entry. Please enter 'list' or 'exit'"
      end 
    end
  end
  
 
  
  def goodbye 
    puts "Goodbye!"
  end
  
end