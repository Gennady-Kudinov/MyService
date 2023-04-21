class AddImagesToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :images, :json
  end
end
