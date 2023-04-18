class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:articles)
      create_table :articles do |t|
        t.string :name
        t.text :title
        t.text :text
  
      t.timestamps
      end
    end
  end
end