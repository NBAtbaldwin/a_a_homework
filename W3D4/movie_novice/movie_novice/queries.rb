# ActiveRecord queries have two methods, to_sql and as_json, that you might find helpful for debugging. The specs use as_json -- feel free to refer to them while writing your queries.
# find, find_by, find_by_#{attribute}, etc. all return the first matching instance from the database; where returns a collection of instances, regardless of the number. Be careful about whether you are expecting the object itself or a collection-wrapped object/set of objects.


# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  #find Angelina Jolie by name in the actors table
  Actor.where('name = ?', 'Angelina Jolie')[0]
end

def top_titles
  # get movie titles from movies with scores greater than or equal to 9
  # hint: use 'select' and 'where'
  Movie.where("movies.score >= 9.0").select("movies.title", "movies.id")
  # hi_rates.map { |movie| movie.title }
end

def star_wars
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'
  Movie.where("movies.title like 'Star Wars%'").select("movies.title", "movies.id", "movies.yr")
end


def below_average_years
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'
  Movie.select('yr', 'COUNT(*) as bad_movies').where('score < 5').group('yr').order('bad_movies DESC')
end

def alphabetized_actors
  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  # Note: Ubuntu users may find that special characters
  # are alphabetized differently than the specs.
  # This spec might fail for Ubuntu users. It's ok!
  Actor.select('*').order("actors.name ASC").limit(10)
end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'
  Actor.select(:id, :name).joins(:movies).where("movies.title = 'Pulp Fiction'")
end

def uma_movies
  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'
  Movie.joins(:actors).select(:title, :id, :yr).where("actors.name='Uma Thurman'").order("movies.yr ASC")
end
