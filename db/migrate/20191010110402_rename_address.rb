class RenameAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :region, :prefecture_id
  end
end
