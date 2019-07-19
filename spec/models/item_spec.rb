require 'rails_helper'

RSpec.describe Item, type: :model do
  context "when a item is valid" do
    it "is valid with all data" do
      item = build(:item)
      expect(item).to be_valid
    end
  end

  context "when a item is invalid" do
    it "is invalid without artist_id" do
      item = build(:item, artist_id: nil)
      expect(item).to_not be_valid
    end

    it "is invalid without label_id" do
      item = build(:item, label_id: nil)
      expect(item).to_not be_valid
    end

    it "is invalid without genre_id" do
      item = build(:item, genre_id: nil)
      expect(item).to_not be_valid
    end

    it "is invalid without title" do
      item = build(:item, title: "   ")
      expect(item).to_not be_valid
    end

    it "is invalid without price" do
      item = build(:item, price: nil)
      expect(item).to_not be_valid
    end

    it "is invalid without stock" do
      item = build(:item, stock: nil)
      expect(item).to_not be_valid
    end
    
    it "is invalid with price on string" do
      item = build(:item, price: "aaaaa")
      expect(item).to_not be_valid
    end

    it "is invalid with stock on string" do
      item = build(:item, stock: "aaaaa")
      expect(item).to_not be_valid
    end

    it "is invalid with price on float" do
      item = build(:item, price: 10.3)
      expect(item).to_not be_valid
    end

    it "is invalid with stock on float" do
      item = build(:item, stock: 10.3)
      expect(item).to_not be_valid
    end
  end
end
