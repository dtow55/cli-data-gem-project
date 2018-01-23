require_relative '../zrankings.rb'
require 'pry'

def Zrankings::Resort

    attr_accessor :name, :location, :url, :snowfall, :peak_elevation,
                :vertical, :acres, :rank, :multipass, :description

    @@all = []

    def self.all
        @@all
    end
end

#r = Resort.new
#binding.pry