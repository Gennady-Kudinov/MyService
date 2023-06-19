class RemoveCarIdAndImagesFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :car_id, :integer
    remove_column :orders, :images, :string
  end
end
