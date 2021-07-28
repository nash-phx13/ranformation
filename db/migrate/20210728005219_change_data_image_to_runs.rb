class ChangeDataImageToRuns < ActiveRecord::Migration[5.2]
  def change
     change_column :runs, :image, :string
  end
end
