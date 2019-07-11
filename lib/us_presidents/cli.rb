class UsPresidents::CLI 

  def call 
    puts "\nWelcome! Let's learn about the US Presidents!\n".red
    print "* * * * * *".blue
    puts "IIIIIIIIIIIIIIIIIIIIIIII".red 
    print "* * * * * *".blue
    puts "IIIIIIIIIIIIIIIIIIIIIIII".white
    print "* * * * * *".blue
    puts "IIIIIIIIIIIIIIIIIIIIIIII".red 
    print "* * * * * *".blue
    puts "IIIIIIIIIIIIIIIIIIIIIIII".white
    puts "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII".red
    puts "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII".white
    puts "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII".red
    puts "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII".white
    puts "IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII".red
    
    
    puts "\nHere is a list of all US Presidents: \n".blue
    puts 
    UsPresidents::Scraper.new.scrape_articles
    list_stories
    menu
  end 
  
  def list_stories 
    UsPresidents::Story.all.each_with_index do |story, i|
      puts "#{i+1}. #{story.name}"
    end
  end 
  
  def menu 
    input = ""
    while input != "exit"
      puts "\nType the number of the president you would like to read more information on.\n".blue
      input = gets.strip.to_i 
      max_value = UsPresidents::Story.all.length 
      if input.between?(1, max_value)
        story = UsPresidents::Story.all[input.to_i-1]
        puts "\nHere is some quick information: \n".blue
        puts "\nPresident's Name: #{story.name}"
        puts "Inaguration: #{story.inaguration}"
        puts "End of presidency: #{story.end_date}"
        
        puts "\nWould you like to read more? Type 'YES' or 'NO'".blue
        answer = gets.strip 
        
        if ["Y", "YES"].include?(answer.upcase)
          #call the scraper for additional details
          
          unless story.additional_details
            UsPresidents::Scraper.new.scrape_additional_details(story)
          end
      
      
      
          puts story.additional_details 
        end 
        else  
          puts "Invalid input. Please select only a number from the list above.".red 
        end 
   
      puts "Please type 'exit' to leave the program or 'list' to see the list again.".blue
      input = gets.strip.downcase 
      
      if input == "list"
        puts "Here is the list: ".blue
        list_stories
      elsif input == "exit"  
        puts "Goodbye!".blue
      else
        puts "Invalid entry".red
      end
    end 
  end
end 