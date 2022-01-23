class CreateAlcoolComments < ActiveRecord::Migration[5.2]
  def change
    create_table :alcool_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :alchool_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
