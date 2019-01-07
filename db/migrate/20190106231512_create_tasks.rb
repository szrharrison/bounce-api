class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.string :name
      t.integer :urgency
      t.integer :importance
      t.boolean :easy_startable, default: false
      t.datetime :due_date

      t.timestamps
    end
  end
end
