class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.integer :region, null: false
      t.string :city, null: false 
      t.string :building
      t.string :phone
      t.timestamps
    end
  end
end
