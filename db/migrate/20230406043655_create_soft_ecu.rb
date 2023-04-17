class CreateSoftEcu < ActiveRecord::Migration[7.0]
  def change
    create_table :soft_ecus do |t|
      t.string :name
      t.references :model_ecu, null: true, foreign_key: true

      t.timestamps
    end
  end
end
