require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  context "when an order_detail is valid" do
    it "is valid with all data" do
      order_detail = build(:order_detail)
      expect(order_detail).to be_valid
    end
  end  

  context "when a order_detail is invalid" do

    it "is invalid without payment" do
      order_detail = build(:order_detail, cd_amount: nil)
      expect(order_detail).to_not be_valid
    end

    it "is invalid without payment" do
      order_detail = build(:order_detail, cd_price: nil)
      expect(order_detail).to_not be_valid
    end
  end
end
