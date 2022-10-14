class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :status
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
