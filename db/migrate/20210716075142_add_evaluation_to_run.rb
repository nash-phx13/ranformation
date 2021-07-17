class AddEvaluationToRun < ActiveRecord::Migration[5.2]
  def change
    add_column :runs, :evaluation, :float
  end
end