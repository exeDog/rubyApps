# frozen_string_literal: true

require_relative 'users'

module RubyApps
  class Authenticator
    MAX_ATTEMPTS = 5

    def initialize
      @attempts = 1
      puts 'Welcome to the authenticator'
      25.times { print '-' }
      puts

      execute
    end

    def execute
      while @attempts <= MAX_ATTEMPTS
        begin
          user_inputs

          authenticate!

          puts "Welcome #{@username}"
          exit
        rescue StandardError => _e
          puts 'Username/Password incorrect'
          puts 'Press q to quit or any other key to continue'
          input = STDIN.gets.chomp
          exit if input == 'q'
        ensure
          @attempts += 1
        end
      end
      exit
    end

    def user_inputs
      puts 'Enter the username'
      @username = STDIN.gets.chomp
      25.times { print '-' }
      puts
      puts 'Enter your password'
      @password = STDIN.gets.chomp
    end

    private

    def authenticate!
      resp = USERS.find do |user|
        user[:username].downcase == @username && user[:password] == @password
      end
      raise StandardError('User not found') if resp.nil?
    end
  end
end
