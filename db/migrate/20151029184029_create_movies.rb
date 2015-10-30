class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string   "title"
	    t.text     "overview"
	    t.string   "release_date"
	    t.string   "poster_url"
	    t.text     "tagline"
	    t.integer  "runtime"
	    t.string   "imdb_id"
	    t.integer  "tmd_id"
	    t.string   "backdrop_url"
	    t.string   "genre"
	    t.integer  "genre_id"
	    t.boolean  "adult"
      t.timestamps null: false
    end
  end
end
