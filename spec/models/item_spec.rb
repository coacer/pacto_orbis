require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "when a item is valid" do
    it "is valid with all data" do
      item = build(:item)
      expect(item).to be_valid
    end
  end

  describe "when a item is invalid" do
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
  end
end
