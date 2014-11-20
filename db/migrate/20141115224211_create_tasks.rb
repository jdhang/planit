class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :note
      t.date :due_on
      t.boolean :completed, default: false
      t.date :completed_on
      t.integer :project_id, :user_id
      t.timestamps
    end
  end
end
