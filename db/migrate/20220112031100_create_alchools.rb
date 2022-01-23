class CreateAlchools < ActiveRecord::Migration[5.2]
  def change
    create_table :alchools do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :osake_image_id
      t.timestamps
    end
  end
end
