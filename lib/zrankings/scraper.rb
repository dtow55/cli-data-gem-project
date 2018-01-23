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
        scrape_resorts.each do |resort_xml|
            name = resort_xml.css("td#name-rank-index a").text
            location = resort_xml.css("td#name-rank-index span").text
            rank = resort_xml.css("tr.top-rowdy td")[0].text
            url = "https://www.zrankings.com/" + resort_xml.css("td#name-rank-index a").attribute('href').value
            description = resort_xml.css("div.index-table-text-box")[0].text.strip

            Zrankings::Resort.new(name, location, rank, url, description)

            binding.pry
        end
    end
end

Zrankings::Scraper.new.create_resorts