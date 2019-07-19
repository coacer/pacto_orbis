require 'rails_helper'

RSpec.describe Artist, type: :model do
  context "when a artist is valid" do
    it "is valid with name" do
      artist = build(:artist)
      expect(artist).to be_valid
    end
  end

  context "when a artist is invalid" do
    it "is invalid without name" do
      artist = build(:artist, name: "   ")
      expect(artist).to_not be_valid
    end
  end
end
