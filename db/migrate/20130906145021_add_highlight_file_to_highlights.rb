class AddHighlightFileToHighlights < ActiveRecord::Migration
  def up
    add_column :highlights, :highlight_file, :string
  end

  def down
  	remove_column :highlights, :highlight_file
  end
end
