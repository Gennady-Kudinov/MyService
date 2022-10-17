class AddMileageToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :mileage, :integer, default: 0
  end
end
