require 'rails_helper'

describe Users::RegistrationsController do
  describe '#create' do
    it "nil email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "password match" do
      user = build(:user)
      user.valid?
      expect(user.errors[:password_confirmation]).to be_present
    end
  end
end