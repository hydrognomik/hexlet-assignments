class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description, null: true
      t.string :status, default: :new
      t.string :creator
      t.string :performer, null: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
