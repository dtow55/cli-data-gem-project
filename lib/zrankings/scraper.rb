require_relative '../zrankings.rb'
require 'pry'
require 'nokogiri'
require 'open-uri'

class Zrankings::Scraper

    def get_page
        doc = Nokogiri::HTML(open("https://www.zrankings.com/"))
        binding.pry
        #opens zrankings.com using open-uri and assigns it to a 'doc' variable using Nokogiri
    end

    def scrape_resorts
        #calls #get_page and returns an array of XML objects from which we will scrape resorts
    end

    def create_resorts
        #calls #scrape_resorts and a Resort class method to create Resort objects with information
        #scraped from Nokogiri XML
    end
end

Zrankings::Scraper.new.get_page