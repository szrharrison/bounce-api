class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.integer :importance, default: 0
      t.integer :urgency, default: 0
      t.datetime :due_date
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
