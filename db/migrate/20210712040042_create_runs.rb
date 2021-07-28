class CreateRuns < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.string :title
      t.string :genre
      t.text :body
      t.integer :like_count
      t.integer :comment_count
      t.integer :user_id
      t.string :image_id

      t.timestamps
    end
  end
end
