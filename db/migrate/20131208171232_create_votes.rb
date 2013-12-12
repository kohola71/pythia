class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :possible_answer_id
    end
  end
end
