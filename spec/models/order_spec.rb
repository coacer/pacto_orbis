require 'rails_helper'

RSpec.describe Order, type: :model do
  context "when an order is valid" do
    it "is valid with all data" do
      order = build(:order)
      expect(order).to be_valid
    end
  end  

  context "when a order is invalid" do
    it "is invalid with blank total_price" do
      order = build(:order, total_price: "   ")
      expect(order).to_not be_valid
    end

    it "is invalid without payment" do
      order = build(:order, payment: nil)
      expect(order).to_not be_valid
    end

    it "is invalid without status" do
      order = build(:order, status: nil)
      expect(order).to_not be_valid
    end

    it "is invalid with postal_code hiragana and katakana" do
      order_with_hiragana = build(:order, postal_code: "ひらがな")
      order_with_katakana = build(:order, postal_code: "カタカナ")
      expect(order_with_hiragana).to_not be_valid
      expect(order_with_katakana).to_not be_valid
    end

    it "is invalid with too short postal_code" do
      order = build(:order, postal_code: "0" * 4)
      expect(order).to_not be_valid
    end

    it "is invalid with too long postal_code" do
      order = build(:order, postal_code: "0" * 10)
      expect(order).to_not be_valid
    end

    it "is invalid with blank address" do
      order = build(:order, address: "   ")
      expect(order).to_not be_valid
    end

    it "is invalid without delivery_cost" do
      order = build(:order, delivery_cost: nil)
      expect(order).to_not be_valid
    end
  end
end
