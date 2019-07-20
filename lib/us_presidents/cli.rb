class UsPresidents::CLI 
  
  def initialize
    @number_of_presidents = 0
  end
  
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
    UsPresidents::Scraper.scrape_articles
    @number_of_presidents =  UsPresidents::Story.all.length
    list_stories
    menu
  end 
  
  def list_stories 
    UsPresidents::Story.all.each_with_index do |story, i|
      puts "#{i+1}. #{story.name}"
    end
  end 
  
  def print_Story(story)
    puts "\nHere is some quick information: \n".blue
    puts "\nPresident's Name: #{story.name}"
    puts "Inaguration: #{story.inaguration}"
    puts "End of presidency: #{story.end_date}"
    puts "\nWould you like to read more? Type 'YES' or 'NO'".blue
  end
  
  def process_input(input)
    story = UsPresidents::Story.all[input.to_i-1]
    print_Story(story)
    answer = gets.strip 
    if ["Y", "YES"].include?(answer.upcase)
      unless story.additional_details
        UsPresidents::Scraper.scrape_additional_details(story)
      end
      puts story.additional_details 
    end 
  end
  
  def process_choice(input)
      if input == "list"
        puts "Here is the list: ".blue
        list_stories
      elsif input == "exit"  
        puts "Goodbye!".blue
      else
        puts "Invalid entry".red
      end
  end
  
  def menu 
    input = ""
    while input != "exit"
      puts "\nType the number of the president you would like to read more information on.\n".blue
      input = gets.strip.to_i 
      if input.between?(1, @number_of_presidents)
        process_input(input)
      else  
        puts "Invalid input.".red 
      end 
      puts "Please type 'exit' to leave the program or 'list' to see the list again.".blue
      input = gets.strip.downcase 
      process_choice(input)
    end 
  end
end 