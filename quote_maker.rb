quotes = File.open("/Users/mendelblesofsky/Development/projects/Guess-the-Movie/movie_files/Scarface/quotes", 'r').read.split('~ ~')
	Dir.glob("/Users/mendelblesofsky/Development/projects/Guess-the-Movie/movie_files/Scarface/*.mp3").each_with_index do |file, i|
			Quote.create(quote: quotes[i], movie_id: 274, audio_path: file)
	end