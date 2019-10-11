class RenameActiveHash < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :region, :region_id
    rename_column :items, :shipping_fee_burden, :shipping_fee_burden_id
    rename_column :items, :shipping_method, :shipping_method_id
    rename_column :items, :shipping_duration, :shipping_duration_id
  end
end
