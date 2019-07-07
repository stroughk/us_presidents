class UsPresidents::CLI 

  def call 
    puts "\nWelcome!!!!\n".yellow
    puts "\nHere is a list of all US Presidents: \n".blue
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
      puts "\nWhich president do you want to read more information on?\n".blue
      input = gets.strip 
      
      if input.to_i-1 <= UsPresidents::Story.all.size 
        story = UsPresidents::Story.all[input.to_i-1]
        
        
        puts "\nHere is some quick information: \n".yellow
        puts "\nPresident's Name: #{story.name}"
        puts "Inaguration: #{story.inaguration}"
        puts "End of presidency: #{story.end_date}"
        
        puts "Would you like to read more?".yellow
        answer = gets.strip 
        
        if ["Y", "YES"].include?(answer.upcase)
        content = UsPresidents::Scraper.scrape_content  
        puts content
        end 
      end
      puts "Would you like to exit or list again?".blue
      input = gets.strip 
      
      if input == "list"
        puts "Here is the list: ".yellow
        list_stories
      elsif input == "exit"  
        puts "Goodbye!".yellow
      else
        puts "Invalid entry".red
      end
  
    end 
  end
end 