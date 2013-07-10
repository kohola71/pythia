class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|

t.string :name
t.integer :decision_id # or t.references :decision

      t.timestamps
    end
  end
end
