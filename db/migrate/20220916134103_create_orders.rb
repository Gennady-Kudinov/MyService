class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.text :problem
      t.text :work_description
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
