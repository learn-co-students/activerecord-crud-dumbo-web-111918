require 'pry'

# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new # instantiate a new class
  movie.title = "This is a title."
  movie.save # save a new instance to the database
end

def can_be_created_with_a_hash_of_attributes
  # Initialize movie and then and save it
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new(attributes) # use a hash of attributes to instantiate a new instance
  movie.save # save instance to the db
  movie
  # binding.pry
end

def can_be_created_in_a_block(args = {title:"Home Alone", release_date: 1990} )
  # If no arguments are passed, use default values:
  # title == "Home Alone"
  # release_date == 1990

  Movie.create do |m|
    m.title = args[:title]
    m.release_date = args[:release_date]
    m.save
  end
end

def can_get_the_first_item_in_the_database
  Movie.find_by(id:1)
  # can also use....
  # Movie.first

end

def can_get_the_last_item_in_the_database
  Movie.last
end

def can_get_size_of_the_database
  Movie.count
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find_by(id:1)
end

def can_find_by_multiple_attributes
  # Search Values:
  # title == "Title"
  # release_date == 2000
  # director == "Me"
  Movie.find_by(title: "Title", release_date: 2000, director: "Me") # find a record by there values
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  Movie.where("release_date > 2002").order(release_date: :desc) #most SQL commans in active record written as symbols
  # SQL query in .where is a string
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick", save it, then return it
  Movie.create(title: "Awesome Flick")
  mov = Movie.find_by(title: "Awesome Flick")
  mov.update(title: "Even Awesomer Flick" )
  mov.save # Save new instance to the database
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  mov = Movie.create(title: "Wat?")
  mov.update(title: "Wat, huh?") # use to update any record's columns, IE similar to using just mov.title = "Wat, Huh?"
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i) # use to create a table, with named columns
  end
  # binding.pry
  Movie.all.each {|mov| mov.update(title: "A Movie")}
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  mov = Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once")
  mov.delete # deletes from record
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.all.each {|mov| mov.delete}
end
