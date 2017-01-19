require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without an body" do
      user = build(:message)
      user.valid?
      expect(user.errors[:body]).to include("を入力してください。")
    end
  end
end