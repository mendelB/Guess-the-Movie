# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'JSON'
counter = 0
did_not_work = []
files = Dir.glob("#{Rails.root}/app/assets/audios/*")
files.each_with_index do |movie_path, index|
begin
	movie_name = movie_path.split('audios/')[1].gsub('_', '%20')
	result = JSON.parse(open("https://api.themoviedb.org/3/search/movie?api_key=88f88122176bc2e5f28b97f9b05352e8&query=#{movie_name}").read)
	movie_id = result['results'][0]['id']
	info = JSON.parse(open("http://api.themoviedb.org/3/movie/#{movie_id}?api_key=88f88122176bc2e5f28b97f9b05352e8").read)
	poster_url = "http://image.tmdb.org/t/p/w500" + info['poster_path']
	if info['backdrop_path']
		backdrop_url = "http://image.tmdb.org/t/p/w500" + info['backdrop_path']
	else
		backdrop_url = "nil"
	end
	if info['genres'].length > 0
		genre = info['genres'][0]['name'] || 'nil'
		genre_id = info['genres'][0]['id'] || "nil"
	else
		genre = 'nil'
		genre_id = 'nil'
	end
	id = Movie.create(
		title: info['original_title'],
		overview: info['overview'],
		release_date: info['release_date'],
		tagline: info['tagline'],
		runtime: info['runtime'],
		imdb_id: info['imdb_id'],
		tmd_id: info['id'],
		genre: genre,
		genre_id: genre_id,
		adult: info['adult'],
		poster_url: poster_url,
		backdrop_url: backdrop_url
	)
	quotes = File.open("#{files[index]}/quotes*", 'r').read.split('~ ~')
	Dir.glob("#{movie_path}/*.mp3").each_with_index do |file, i|
			Quote.create(quote: quotes[i], movie_id: id, audio_path: file)
	end
rescue
	did_not_work << [movie_name, movie_id]

	puts "#{index+1} did not work!!!! fck!"
end
	puts "finished #{index}"
	if counter == 19 
		sleep 10
		counter = 0
	end
	counter += 1
end
puts did_not_work
