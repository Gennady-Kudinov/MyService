class AddImageToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :image, :string
  end
end
