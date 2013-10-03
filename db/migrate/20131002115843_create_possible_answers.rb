class CreatePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :possible_answers do |t|
      t.text :body
      t.integer :question_id

      t.timestamps
    end
  end
end
