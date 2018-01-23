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
        #requests input after resort index is printed
    end

    def print_resort_detail(resort)
        #prints more detail on a particular resort
    end
end