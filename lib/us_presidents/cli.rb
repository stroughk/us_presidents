class UsPresidents::CLI 
  
  def call 
    puts "\nWelcome!!!!\n"
    puts "\nHere is a list of all US Presidents: \n"
    puts 
    UsPresidents::Scraper.new.scrape_articles
    list_stories
    menu
  end 
  
  def list_stories 
    UsPresidents::Story.all.each_with_index do |story, i|
      puts "#{i+1} #{story.name}"
    end
  end 
  
  def menu 
    input = ""
    while input != "exit"
      puts "\nWhich president do you want to read more information on?\n"
      input = gets.strip 
      
      if input.to_i-1 <= UsPresidents::Story.all.size 
        story = UsPresidents::Story.all[input.to_i-1]
        
        puts story.name 
        puts
        puts "President's Name: #{story.name}"
        puts "Inaguration: #{story.inaguration}"
        puts "End of presidency: #{story.end_date}"
        
        puts "Would you like to read more?"
        answer = gets.strip 
        
        if ["Y", "YES"].include?(answer.upcase)
          
        end 
      end
      puts "Would you like to exit or list again?"
      input = gets.strip 
      
      if input == "list"
        list_stories
      elsif input == "exit"  
        puts "Goodbye!"
      else
        puts "Invalid entry"
      end
  
    end 
  end
end 