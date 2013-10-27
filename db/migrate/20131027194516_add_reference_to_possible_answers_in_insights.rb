class AddReferenceToPossibleAnswersInInsights < ActiveRecord::Migration
  def change
    add_column :insights, :possible_answer_id, :integer
  end
end
