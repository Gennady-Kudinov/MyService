class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.string :name, null: false 
      t.timestamps
    end
  end
end
