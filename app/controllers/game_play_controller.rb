class GamePlayController < ApplicationController
  def play

  end

  def movies
  	@movie = Movie.all.sample
    # until @movie.is_clean?
    #   @movie = Movie.all.sample
    # end
  	@movies = @movie.get_movies  
    render style: false
  end

  def new
  	@movie = Movie.all.sample
    # until @movie.is_clean?
    #   @movie = Movie.all.sample
    # end
  	@movies = @movie.get_movies_same_genre
    render style: false
  end
  
end
