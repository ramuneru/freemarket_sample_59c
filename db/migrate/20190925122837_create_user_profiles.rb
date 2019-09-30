class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nickname, null: false
      t.string :family_name, null: false
      t.string :last_name, null: false
      t.string :family_name_kana, null: false
      t.string :last_name_kana, null: false
      t.text :introduction
      t.integer :birth_month, null:false#生まれた年
      t.integer :date_of_birth, null:false#生まれた月
      t.integer :birth_year, null:false#生まれた日
      t.text :icon_image
      t.integer :total_sales
      t.timestamps
    end
  end
end