class CreateEcms < ActiveRecord::Migration[7.0]
  def change
    create_table :ecms do |t|
      t.text :name

      t.timestamps
    end
    add_index :ecms, :name
  end
end
