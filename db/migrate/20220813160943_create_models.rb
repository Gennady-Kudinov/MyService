class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :name
      t.references :make, null: false, foreign_key: true

      t.timestamps
    end
  end
end
