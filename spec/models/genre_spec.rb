require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "when a genre is valid" do
    it "is valid with name" do
      genre = build(:genre)
      expect(genre).to be_valid
    end
  end

  context "when a genre is invalid" do
    it "is invalid without name" do
      genre = build(:genre, name: "   ")
      expect(genre).to_not be_valid
    end
  end
end
