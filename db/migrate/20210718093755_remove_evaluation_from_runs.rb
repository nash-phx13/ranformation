class RemoveEvaluationFromRuns < ActiveRecord::Migration[5.2]
  def change
    remove_column :runs, :evaluation, :float
  end
end
