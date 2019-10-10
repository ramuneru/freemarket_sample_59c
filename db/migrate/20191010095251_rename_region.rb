class RenameRegion < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :region_id, :prefecture_id
  end
end
