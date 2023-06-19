class RemoveEcmIdFromCars < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :ecm_id, :integer
  end
end
