class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :title
      t.string :genre
      t.text :body
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
