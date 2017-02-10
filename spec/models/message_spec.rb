require 'rails_helper'
describe Message do
  describe '#create' do
    it "is valid with a body" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without an body" do
      user = build(:message, :with_empty_body)
      user.valid?
      expect(user.errors[:body]).to include("を入力してください。")
    end
  end
end
