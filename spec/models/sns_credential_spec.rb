require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe '#create' do
    it "レコードの作成ができる" do
      sns_credential = build(:sns_credential)
      expect(sns_credential).to be_valid
    end

    it "uidがないと作成できない" do
      sns_credential = build(:sns_credential, uid: "")
      sns_credential.valid?
      expect(.errors[:uid]).to include("can't be blank")
    end

    it "providerがないと作成できない" do
      sns_credential = build(:sns_credential, provider: "")
      sns_credential.valid?
      expect(.errors[:uid]).to include("can't be blank")
    end
  end
end
