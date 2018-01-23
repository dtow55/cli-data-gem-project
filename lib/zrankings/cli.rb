require 'pry'

class Zrankings::CLI

    def call
        #scrape resort index

        run
    end

    def run
        #print list of resorts
        #request input from user to select a resort to get more information on
        #if input is 'exit', then quit; otherwise show more detail on requested resort
        #after printing more detail, request input again to go back or exit
        #if user inputs 'back' then call #run again
    end

    def print_resort_list
        #prints resort index
    end

    def request_input
        #requests input after resort index is printed
    end

    def print_resort_detail(resort)
        #prints more detail on a particular resort
    end
end