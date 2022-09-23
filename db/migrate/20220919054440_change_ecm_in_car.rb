class ChangeEcmInCar < ActiveRecord::Migration[7.0]
  def change
    change_column_null :cars, :ecm_id, true 
  end
end
