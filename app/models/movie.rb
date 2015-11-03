class Movie < ActiveRecord::Base
	has_many :quotes

	def get_movies
		movies = []
		movies << self.poster_url
		until movies.length == 4
			movie = Movie.all.sample.poster_url
			movies << movie if movie != self.poster_url
			movies.uniq!
		end
		movies.shuffle!
	end
end
