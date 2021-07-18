class AddEvaluationToRunComments < ActiveRecord::Migration[5.2]
  def change
    add_column :run_comments, :evaluation, :float
  end
end
