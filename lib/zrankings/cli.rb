require_relative '../zrankings.rb'
require_relative './scraper.rb'
require 'pry'

class Zrankings::CLI

    def call
        Zrankings::Scraper.new.create_resorts

        run
    end

    def run
        print_resort_list
        #request input from user to select a resort to get more information on
        #if input is 'exit', then quit; otherwise show more detail on requested resort
        #after printing more detail, request input again to go back or exit
        #if user inputs 'back' then call #run again
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

    def request_input
        puts "Enter the number of the resort you would like to get " \
        "more information on, or type 'exit' to quit.".colorize(:light_blue)

        input = gets.strip
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