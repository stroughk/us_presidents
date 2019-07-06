class UsPresidents::CLI 
  
  def call 
    puts "Welcome to learn about US Presidents!"
    UsPresidents::Scraper.scrape_presidents
    list_presidents
    menu
    end 
  
    def list_presidents 
    @presidents = UsPresidents::Scraper.scrape_presidents
    @presidents.each.with_index(1).each do |link, index|
     puts "#{index}. #{link.text}"
    end
  end


  def menu 
    input = ""
    while input != "exit"
      puts "Type in the number of the president you want to read more: "
      input = gets.strip 
    
      if input.to_i-1 <= UsPresidents::Details.all.size 
        story = UsPresidents::Details.all[input.to_i-1]
      
        puts UsPresidents::Scraper.scrape_presidents
        #puts
        #puts "By: #{story.author}"
        #puts "Summary: #{story.summary}"
      
        #puts "Would you like to read more?"
        #answer = gets.strip 
      
        #if ["Y", "YES"].include?(answer.upcase)
        
        #puts story.content 
        #end 
      #end
      #puts "Would you like to exit or list again?"
      #input = gets.strip 
    end
  end
end
end 