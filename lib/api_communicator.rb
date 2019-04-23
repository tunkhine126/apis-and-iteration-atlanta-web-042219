require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string.body)
  films = []
  response_hash["results"].each_with_index do |char, index|
    if char["name"] == character_name
        films_array = response_hash["results"][index]["films"]
        films_array.each do |url|
          r_string = RestClient.get(url)
          r_hash = JSON.parse(r_string.body)
          films << r_hash
        end
      end
    end
films
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `rint_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end





def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  titles = []
films.each do |movie|
  movie.collect do |key, value|
    if key == "title"
      titles << value
    end
  end
end
puts titles
end


def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
