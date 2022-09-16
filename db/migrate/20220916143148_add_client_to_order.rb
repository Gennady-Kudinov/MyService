class AddClientToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :client, null: false, foreign_key: true
  end
end
