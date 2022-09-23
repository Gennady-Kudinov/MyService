class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :licence
      t.string :name
      t.string :phone
      t.date :data
      
      t.timestamps
    end
  end
end
