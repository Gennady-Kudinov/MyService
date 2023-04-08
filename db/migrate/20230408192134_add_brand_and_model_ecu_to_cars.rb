class AddBrandAndModelEcuToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :brand_ecu_id, :integer
    add_column :cars, :model_ecu_id, :integer
  end
end
