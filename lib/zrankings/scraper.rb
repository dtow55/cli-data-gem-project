require_relative '../zrankings.rb'
require 'pry'
require 'nokogiri'
require 'open-uri'

class Zrankings::Scraper

    def get_page
        doc = Nokogiri::HTML(open("https://www.zrankings.com/"))
    end

    def scrape_resorts
        get_page.css("tbody.single-resort-cell")
    end

    def create_resorts
        #calls #scrape_resorts and a Resort class method to create Resort objects with information
        #scraped from Nokogiri XML
    end
end

Zrankings::Scraper.new.scrape_resorts