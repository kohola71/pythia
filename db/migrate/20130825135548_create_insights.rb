class CreateInsights < ActiveRecord::Migration
  def change
    create_table :insights do |t|
      t.text :body
      t.string :kind
      t.integer :question_id
    end
  end
end
