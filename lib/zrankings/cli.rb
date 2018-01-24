class Zrankings::CLI

    def call
        Zrankings::Scraper.new.create_resorts

        run
    end

    def run
        print_resort_list
        
        puts "Enter the number of the resort you would like to get " \
        "more information on, or type 'exit' to quit.".colorize(:light_blue)

        input = gets.strip  ##INPUT

        # Invalid input handling
        while !(input == 'exit' || input.to_i >= 1 && input.to_i <= 30)
            puts "Input was invalid. Please try again."
            input = gets.strip
        end

        if input != "exit"
            print_resort_detail(Zrankings::Resort.find_by_rank(input))
            
            puts "Type 'back' to return to resort list, or 'exit' to quit.".colorize(:light_blue)
            
            input_2 = gets.strip  ##INPUT
            
            # Invalid input handling
            while !(input_2 == 'exit' || input_2 == 'back')
                puts "Input was invalid. Please try again."
                input_2 = gets.strip
            end
            
            if input_2 == "back"
                run
            end
        end
    end

    def print_resort_list
        puts ""
        puts "------ ZRankings.com Top 30 North American Ski Resorts ------".colorize(:light_blue)
        puts ""

        Zrankings::Resort.all.each do |resort|
            puts "  #{resort.rank}.  ".colorize(:light_blue) + "#{resort.name}, #{resort.location}"
        end

        puts ""
    end

    def print_resort_detail(resort)
        puts ""
        print "--------".colorize(:light_blue)
        print " #{resort.name}, #{resort.location} "
        print"--------".colorize(:light_blue)
        puts ""
        puts ""
        puts "Rank: ".colorize(:light_blue) + "#{resort.rank}"
        puts "Avg Annual Snowfall: ".colorize(:light_blue) + "#{resort.snowfall}"
        puts "Peak Elevation: ".colorize(:light_blue) + "#{resort.peak_elevation}"
        puts "Vertical Drop: ".colorize(:light_blue) + "#{resort.vertical}"
        puts "Acreage: ".colorize(:light_blue) + "#{resort.acres}"
        puts "Multipass: ".colorize(:light_blue) + "#{resort.multipass}"
        puts ""
        puts "Description:\n".colorize(:light_blue) + "#{resort.description}"
        puts ""
    end
end