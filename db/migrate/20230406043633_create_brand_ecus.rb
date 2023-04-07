class CreateBrandEcus < ActiveRecord::Migration[7.0]
  def change
    create_table :brand_ecus do |t|
      t.string :name

      t.timestamps
    end
  end
end
