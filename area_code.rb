# frozen_string_literal: true

require_relative 'data/cities'

module RubyApps
  class AreaCode
    def initialize
      puts 'Welcome to area finder'
      25.times { print '-' }
      puts
      puts 'Here are list of cities available'
      puts show_available_cities
      25.times { print '-' }
      validate!
      puts "The zip code for #{@city} is #{execute}"
      exit
    end

    def user_input
      puts 'Enter the city name'
      @city = STDIN.gets.chomp
    end

    def validate!
      user_input
      return if show_available_cities.include? @city

      puts 'Not a valid city'
      exit
    end

    private

    def show_available_cities
      CITIES.keys
    end

    def execute
      resp = CITIES.find { |city| city[0] == @city }
      resp[1] unless resp.nil?
    end
  end
end
