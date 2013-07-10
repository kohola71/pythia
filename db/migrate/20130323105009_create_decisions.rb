class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
t.string :question
t.text :description


      t.timestamps
    end
  end
end
