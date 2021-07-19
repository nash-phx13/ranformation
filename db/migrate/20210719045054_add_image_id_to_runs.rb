class AddImageIdToRuns < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :image_id, :integer
  end
end
