require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with a email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without an email" do
      user = build(:user, :with_email)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "is invalid without an password" do
      user = build(:user, :with_password)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, :with_password_confirmation)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します。")
    end

    it "is invalid with a password that has more than 8 characters " do
      user = build(:user, :with_password_relationship_more)
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, :with_password_relationship_less)
      user.valid?
      expect(user.errors[:password][0]).to include("は8文字以上で入力してください")
    end
  end
end

