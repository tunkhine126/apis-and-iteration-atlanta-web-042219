#!/usr/bin/env ruby
require 'pry'

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

def run
  welcome
  character = get_character_from_user
  show_character_movies(character)
  # print_movies(movies)
  # show_character_movies(character)
end

run
