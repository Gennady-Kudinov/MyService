class CreateSwIdents < ActiveRecord::Migration[7.0]
  def change
    create_table :sw_idents do |t|
      t.string :name
      t.references :soft_ecu, null: true, foreign_key: true

      t.timestamps
    end
  end
end
