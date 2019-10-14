class AddSizeIdToItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :size, foreign_key: true
  end
end
