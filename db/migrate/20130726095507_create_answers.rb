class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      # t.string :user
      t.references :question

      t.timestamps

    end

	# add_index :questions, :question_id

  end
end
