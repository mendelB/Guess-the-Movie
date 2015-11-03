class Movie < ActiveRecord::Base
	has_many :quotes

	def get_movies
		movies = []
		3.times do 
 			movies << Movie.all.sample.poster_url
		end 
		movies << self.poster_url
		movies.shuffle!
	end
end
