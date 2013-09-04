class ChangeHighlightTypePriceToInteger < ActiveRecord::Migration
  def up
  	change_column :highlight_types, :price, :integer
  end

  def down
  	change_column :highlight_types, :price, :decimal, precision: 8, scale: 2
  end
end
