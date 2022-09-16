class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :licence, index: true
      t.string :vin
      t.string :mileage
      t.references :ecm, null: false, foreign_key: true
      t.integer :sum
      t.references :model, null: false, foreign_key: true
      t.references :make, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
