class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
    	t.integer :user_id, null: false
    	t.integer :highlight_type_id, null: false
    	t.string :name, null: false
    	t.string :nickname
    	t.string :hometown
    	t.string :school
    	t.string :previous_teams
    	t.string :bats
    	t.string :throwing_hand
    	t.string :position
    	t.integer :age
    	t.string :family_friends
    	t.string :opponent
    	t.text :scenario
    	t.text :notes

      t.timestamps
    end

    add_index :highlights, :user_id
    add_index :highlights, :highlight_type_id
  end
end
