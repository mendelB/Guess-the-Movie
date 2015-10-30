class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :quote
      t.string :audio_path
      t.belongs_to :movie, index: :true

      t.timestamps null: false
    end
  end
end
