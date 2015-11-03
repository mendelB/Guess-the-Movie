class GamePlayController < ApplicationController
  def play

  end

  def movies
  	@movie = Movie.all.sample
  	@movies = @movie.get_movies
  end

  def new
  	@movie = Movie.all.sample
  	@movies = @movie.get_movies
    render style: false
  end
  
end
