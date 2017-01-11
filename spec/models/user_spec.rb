require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without an email" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end
  end
end

