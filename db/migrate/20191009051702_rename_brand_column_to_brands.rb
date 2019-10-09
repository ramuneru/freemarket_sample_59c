class RenameBrandColumnToBrands < ActiveRecord::Migration[5.2]
  def change
    rename_column :brands, :brand, :name
  end
end
