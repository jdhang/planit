class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :due_on
      t.boolean :completed, default: false
      t.date :completed_on
      t.integer :user_id
      t.timestamps
    end
  end
end
