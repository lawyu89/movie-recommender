class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :path_name
      t.integer :travel_time
      t.timestamps null: false
    end
  end
end
