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
        scrape_resorts.each do |resort_xml|
            Zrankings::Resort.new_from_xml(resort_xml)
        end
        Zrankings::Resort.all
    end
end

Zrankings::Scraper.new.create_resorts