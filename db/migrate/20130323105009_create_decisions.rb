class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
t.string :question
t.text :description
t.string :option1_name
t.string :option1_picture
t.string :option2_name
t.string :option2_picture

      t.timestamps
    end
  end
end
