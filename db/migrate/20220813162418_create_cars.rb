class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :licence, index: true
      t.string :vin
      t.string :mileage
      t.integer :sum
      t.references :model, null: true, foreign_key: true
      t.references :make, null: true, foreign_key: true
      t.references :client, null: true, foreign_key: true
      t.references :brand_ecu, null: true, foreign_key: true
      t.references :model_ecu, null: true, foreign_key: true
      t.references :soft_ecu, null: true, foreign_key: true

      t.timestamps
    end
  end
end
