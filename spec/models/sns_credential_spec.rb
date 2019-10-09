require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe '#create' do
    it "レコードの作成ができる" do
      sns_credential = build(:sns_credential)
      expect(sns_credential).to be_valid
    end
  end
end
