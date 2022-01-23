class CreateAlchoolGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :alchool_genres do |t|
      t.integer :alchool_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
