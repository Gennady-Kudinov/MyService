class ChangeClientsData < ActiveRecord::Migration[7.0]
  def change
    change_column_default :clients, :data, Time.new 
  end
end
