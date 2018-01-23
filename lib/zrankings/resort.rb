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

    def self.all
        @@all
    end
end

#r = Zrankings::Resort.new
#binding.pry