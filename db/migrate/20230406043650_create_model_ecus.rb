class CreateModelEcus < ActiveRecord::Migration[7.0]
  def change
    create_table :model_ecus do |t|
      t.string :name
      t.references :brand_ecu, null: true, foreign_key: true

      t.timestamps
    end
  end
end
