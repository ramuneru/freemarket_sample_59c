class AddColumnDateOfBirthToUserProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :user_profiles, :dateOfbirth, :date
  end
end
