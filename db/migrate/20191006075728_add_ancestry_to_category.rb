class AddAncestryToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
    add_reference :categories, :size, foreign_key: true
  end
end
