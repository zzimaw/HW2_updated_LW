# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Role.destroy_all
Movie.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# 1. Insert data into your database that reflects the sample data shown above 
# 1a. Insert data to Studio
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save
puts new_studio.inspect

#1b. Insert data to Movie
warner_bros = Studio.find_by("name" => "Warner Bros.")
new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = "2005"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["year_released"] = "2008"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["year_released"] = "2012"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save
puts new_movie.inspect

#1c. Insert data to Actor
new_actor = Actor.new
new_actor["Name"] = "Christian Bale"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Michael Caine"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Liam Neeson"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Katie Holmes"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Gary Oldman"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Heath Ledger"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Aaron Eckhart"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Maggie Gyllenhaal"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Tom Hardy"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Joseph Gordon-Levitt"
new_actor.save
new_actor = Actor.new
new_actor["Name"] = "Anne Hathaway"
new_actor.save

puts new_actor.inspect

#1d. Insert Data to Role
#find movie
Batman = Movie.find_by("title" => "Batman Begins")
Dark_Knight = Movie.find_by("title" => "The Dark Knight")
Rises = Movie.find_by("title" => "The Dark Knight Rises")

#find actor 
Christian = Actor.find_by("Name" => "Christian Bale")
Michael = Actor.find_by("Name" =>  "Michael Caine")
Liam = Actor.find_by("Name" =>  "Liam Neeson")
Katie = Actor.find_by("Name" =>  "Katie Holmes")
Gary = Actor.find_by("Name" =>  "Gary Oldman")
Heath = Actor.find_by("Name" =>  "Heath Ledger")
Aaron = Actor.find_by("Name" =>  "Aaron Eckhart")
Maggie = Actor.find_by("Name" =>  "Maggie Gyllenhaal")
Tom = Actor.find_by("Name" =>  "Tom Hardy")
Joseph = Actor.find_by("Name" =>  "Joseph Gordon-Levitt")
Anne = Actor.find_by("Name" =>  "Anne Hathaway")

#assign ids to role table
#Batman Role
role = Role.create(movie_id: Batman["id"], actor_id: Christian["id"], character_name: "Bruce Wayne")
role = Role.create(movie_id: Batman["id"], actor_id: Michael["id"], character_name: "Alfred")
role = Role.create(movie_id: Batman["id"], actor_id: Liam["id"], character_name: "Ra's Al Ghul")
role = Role.create(movie_id: Batman["id"], actor_id: Katie["id"], character_name: "Rachel Dawes")
role = Role.create(movie_id: Batman["id"], actor_id: Gary["id"], character_name: "Commissioner Gordon")

#Dark_Knight Role
role = Role.create(movie_id: Dark_Knight["id"], actor_id: Christian["id"], character_name: "Bruce Wayne")
role = Role.create(movie_id: Dark_Knight["id"], actor_id: Heath["id"], character_name: "Joker")
role = Role.create(movie_id: Dark_Knight["id"], actor_id: Aaron["id"], character_name: "Harvey Dent")
role = Role.create(movie_id: Dark_Knight["id"], actor_id: Michael["id"], character_name: "Alfred")
role = Role.create(movie_id: Dark_Knight["id"], actor_id: Maggie["id"], character_name: "Rachel Dawes")

#Rised Role
role = Role.create(movie_id: Rises["id"], actor_id: Christian["id"], character_name: "Bruce Wayne")
role = Role.create(movie_id: Rises["id"], actor_id: Gary["id"], character_name: "Commissioner Gordon")
role = Role.create(movie_id: Rises["id"], actor_id: Tom["id"], character_name: "Bane")
role = Role.create(movie_id: Rises["id"], actor_id: Joseph["id"], character_name: "John Blake")
role = Role.create(movie_id: Rises["id"], actor_id: Anne["id"], character_name: "Selina Kyle")


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

warner_movie = Movie.where({"studio_id" => warner_bros["id"]})
for movie in warner_movie
  title = movie["title"]
  year_released = movie["year_released"]
  rated = movie["rated"]
  studio_name = Studio.where(id: movie.studio_id).first.name
  puts "#{title} #{year_released} #{rated} #{studio_name}"

end


# Query the movies data and loop through the results to display the movies output.
# TODO!




# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""


# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

movie_roles = Role.where({"movie_id" => movie["id"]})

  for role in movie_roles
    title = Movie.where(id: role.movie_id).first
    actor_record = Actor.where(id: role.actor_id).first
    actor_name = actor_record["name"]
    character_name = role["character_name"]
    puts "#{title} #{actor_name} #{character_name}"
end



