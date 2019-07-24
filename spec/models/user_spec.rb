require 'rails_helper'

RSpec.describe User, type: :model do
  context "when a user is valid" do
    it "is valid with all data" do
      user = build(:user)
      expect(user).to be_valid
    end
  end  

  context "when a user is invalid" do
    it "is invalid with blank email" do
      user = build(:user, email: "   ")
      expect(user).to_not be_valid
    end

    it "is invalid with blank password" do
      password = "    "
      user = build(:user, password: password, password_confirmation: password)
      expect(user).to_not be_valid
    end

    it "is invalid with different password" do
      user = build(:user, password: "aaaaaa", password_confirmation: "bbbbbb")
      expect(user).to_not be_valid
    end

    it "is invalid with too short password" do
      user = build(:user, password: "aaaaa", password_confirmation: "aaaaa")
      expect(user).to_not be_valid
    end

    it "is invalid with blank first_name" do
      user = build(:user, first_name: "    " )
      expect(user).to_not be_valid
    end

    it "is invalid with first_name in katakana" do
      user_with_katakana = build(:user, first_name: "カタカナ" )
      expect(user_with_katakana).to_not be_valid
    end

    it "is invalid with too long first_name" do
      user = build(:user, first_name: "a" * 16 )
      expect(user).to_not be_valid
    end

    it "is invalid with blank last_name" do
      user = build(:user, last_name: "    " )
      expect(user).to_not be_valid
    end

    it "is invalid with last_name in katakana" do
      user_with_katakana = build(:user, last_name: "カタカナ" )
      expect(user_with_katakana).to_not be_valid
    end

    it "is invalid with too long last_name" do
      user = build(:user, last_name: "a" * 16 )
      expect(user).to_not be_valid
    end

    it "is invalid with blank kana_first_name" do
      user = build(:user, kana_first_name: "    " )
      expect(user).to_not be_valid
    end

    it "is invalid with kana_first_name except katakana" do
      user_with_alphabet = build(:user, kana_first_name: "aaaaa" )
      user_with_hiragana = build(:user, kana_first_name: "あああああ" )
      expect(user_with_alphabet).to_not be_valid
      expect(user_with_hiragana).to_not be_valid
    end

    it "is invalid with too long kana_first_name" do
      user = build(:user, kana_first_name: "ア" * 16 )
      expect(user).to_not be_valid
    end

    it "is invalid with blank kana_last_name" do
      user = build(:user, kana_last_name: "    " )
      expect(user).to_not be_valid
    end

    it "is invalid with kana_last_name except katakana" do
      user_with_alphabet = build(:user, kana_last_name: "aaaaa" )
      user_with_hiragana = build(:user, kana_last_name: "あああああ" )
      expect(user_with_alphabet).to_not be_valid
      expect(user_with_hiragana).to_not be_valid
    end

    it "is invalid with too long kana_last_name" do
      user = build(:user, kana_last_name: "ア" * 16 )
      expect(user).to_not be_valid
    end

    it "is invalid with too short phone" do
      user = build(:user, phone: "0" * 9)
      expect(user).to_not be_valid
    end

    it "is invalid with too long phone" do
      user = build(:user, phone: "0" * 12)
      expect(user).to_not be_valid
    end

    it "is invalid with phone except number" do
      user = build(:user, phone: "a" * 10)
      expect(user).to_not be_valid
    end

    it "is invalid with phone except number" do
      user = build(:user, phone: "a" * 10)
      expect(user).to_not be_valid
    end

    it "is invalid with postal_code hiragana and katakana" do
      user_with_hiragana = build(:user, postal_code: "ひらがな")
      user_with_katakana = build(:user, postal_code: "カタカナ")
      expect(user_with_hiragana).to_not be_valid
      expect(user_with_katakana).to_not be_valid
    end

    it "is invalid with too short postal_code" do
      user = build(:user, postal_code: "0" * 4)
      expect(user).to_not be_valid
    end

    it "is invalid with too long postal_code" do
      user = build(:user, postal_code: "0" * 10)
      expect(user).to_not be_valid
    end

    it "is invalid with blank prefecture" do
      user = build(:user, prefecture_name: "   ")
      expect(user).to_not be_valid
    end

    it "is invalid with blank city" do
      user = build(:user, city: "   ")
      expect(user).to_not be_valid
    end

    it "is invalid with blank street" do
      user = build(:user, street: "   ")
      expect(user).to_not be_valid
    end

  end
end
