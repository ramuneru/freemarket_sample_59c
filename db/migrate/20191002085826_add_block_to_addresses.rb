class AddBlockToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :block, :string
  end
end
