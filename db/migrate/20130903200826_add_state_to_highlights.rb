class AddStateToHighlights < ActiveRecord::Migration
  def up
  	add_column :highlights, :state, :string
  end

  def down
  	remove_column :highlights, :state
  end
end
