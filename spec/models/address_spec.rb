require 'rails_helper'

RSpec.describe Address, type: :model do
  context "when a address is valid" do
    it "is valid with all data" do
      address = build(:address)
      expect(address).to be_valid
    end
  end

  context "when a address is invalid" do
    it "is invalid with blank name" do
      address = build(:address, name: "   ")
      expect(address).to_not be_valid
    end

    it "is invalid with too long name" do
      address = build(:address, name: "a" * 31)
      expect(address).to_not be_valid
    end

    it "is invalid with blank postal_code" do
      address = build(:address, postal_code: "   ")
      expect(address).to_not be_valid
    end

    it "is invalid with postal_code hiragana and katakana" do
      address_with_hiragana = build(:address, postal_code: "ひらがな")
      address_with_katakana = build(:address, postal_code: "カタカナ")
      expect(address_with_hiragana).to_not be_valid
      expect(address_with_katakana).to_not be_valid
    end

    it "is invalid with too short postal_code" do
      address = build(:address, postal_code: "0" * 4)
      expect(address).to_not be_valid
    end

    it "is invalid with too long postal_code" do
      address = build(:address, postal_code: "0" * 10)
      expect(address).to_not be_valid
    end

    it "is invalid without user_id" do
      address = build(:address, user_id: nil)
      expect(address).to_not be_valid
    end
  end
end
