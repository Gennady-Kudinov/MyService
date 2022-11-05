class CreateTheFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :the_files do |t|
      t.text :title
      t.text :text

      t.timestamps
    end
  end
end
