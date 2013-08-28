class CreateHighlightTypes < ActiveRecord::Migration
  def change
    create_table :highlight_types do |t|
    	t.string :name, null: false
    	t.string :description, null: false
    	t.decimal :price, precision: 8, scale: 2, null: false
    	t.boolean :active, default: true

      t.timestamps
    end
  end
end
