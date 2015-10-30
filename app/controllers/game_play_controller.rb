class GamePlayController < ApplicationController
  def play

  end

  def movies
  	@movie = Movie.all.sample
  end
end
