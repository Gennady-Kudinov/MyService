class DropArticle < ActiveRecord::Migration[7.0]
  def change
    drop_table :articles
  end
end
