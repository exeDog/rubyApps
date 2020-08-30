# frozen_string_literal: true

require_relative 'authenticator'

module RubyApps
  class Playground
    def initialize
      puts 'Welcome to the App store'
      25.times { print '-' }
      puts
      puts 'Press 1 for the authenticator'
      input = STDIN.gets.chomp
      unless input.to_i == 1
        puts 'Wrong input crashing now'
        exit
      end
      Authenticator.new
    end
  end
end
