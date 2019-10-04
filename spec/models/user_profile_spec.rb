require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  it "is valid user_profile create" do
    user_profile = build(:user_profile)
    expect(user_profile).to be_valid
  end
end
