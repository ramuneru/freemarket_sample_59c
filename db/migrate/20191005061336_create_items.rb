class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title,null: false, unique: true, index: true
      t.text :description, null: false
      t.integer :price, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.integer :condition, null: false
      t.references :size, foreign_key: true
      t.integer :region, null: false
      t.integer :shipping_fee_burden, null: false
      t.integer :shipping_method, null: false
      t.integer :shipping_duration, null: false
      t.string  :sold_date
      t.references :seller, foreign_key: true
      t.references :buyer, foreign_key: true
      t.references :like, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
