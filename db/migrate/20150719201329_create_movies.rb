class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.integer :movie_length
      t.integer :released_year
      t.float :rating
      t.string :thumbnail_url
      t.timestamps null: false
    end
  end
end
