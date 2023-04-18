class AddSwIdentIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :sw_ident, null: true, foreign_key: true
  end
end
