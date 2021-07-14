class CreateRunComments < ActiveRecord::Migration[5.2]
  def change
    create_table :run_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :run_id

      t.timestamps
    end
  end
end
