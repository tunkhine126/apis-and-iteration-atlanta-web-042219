require 'pry'

def welcome
  puts "Welcome to the Star Wars search engine"
end

def get_character_from_user
  puts "Please enter a character name"
  gets.chomp # use gets to capture the user's input. This method should return that input, downcased.
end
