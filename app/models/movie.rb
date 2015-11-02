class Movie < ActiveRecord::Base
	has_many :quotes

	def get_movies
		movies = []
		3.times do 
 			movies << Movie.all.sample.title
		end 
		movies << self.title
		movies.shuffle!
	end
end
