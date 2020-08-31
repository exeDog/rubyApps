# frozen_string_literal: true

require_relative 'authenticator'
require_relative 'area_code'

module RubyApps
  class Playground
    def initialize
      puts 'Welcome to the App store'
      25.times { print '-' }
      puts
      puts 'Press 1 for the authenticator'
      puts 'Press 2 for the area code helper'
      input = STDIN.gets.chomp.to_i
      unless [1, 2].include? input
        puts 'Wrong input crashing now'
        exit
      end
      Authenticator.new if input == 1
      AreaCode.new if input == 2
    end
  end
end
