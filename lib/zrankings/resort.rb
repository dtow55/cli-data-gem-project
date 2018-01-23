require_relative '../zrankings.rb'
require_relative './version.rb'
require 'pry'

class Zrankings::Resort

    attr_accessor :name, :location, :url, :snowfall, :peak_elevation,
                :vertical, :acres, :rank, :multipass, :description

    @@all = []

    def initialize(name=nil, location=nil, rank=nil, url=nil, description=nil)
        @name = name
        @location = location
        @rank = rank
        @url = url
        @description = description
        @@all << self
    end

    def self.new_from_xml(resort_xml)
        self.new(
            resort_xml.css("td#name-rank-index a").text, #name
            resort_xml.css("span.desktop-700").text, #location
            resort_xml.css("tr.top-rowdy td")[0].text, #rank
            "https://www.zrankings.com" + resort_xml.css("td#name-rank-index a")[0].attribute('href').value, #url
            resort_xml.css("div.index-table-text-box").text.strip, #description
        )
    end

    def snowfall
        doc.css("div.snow-icon-2 h3").text
    end

    def peak_elevation
        doc.css("div#vertical-drop span").text
    end

    def doc
        Nokogiri::HTML(open(self.url))
    end

    def self.all
        @@all
    end
end

#r = Zrankings::Resort.new
#binding.pry