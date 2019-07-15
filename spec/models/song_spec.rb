require 'rails_helper'

RSpec.describe Song, type: :model do
  context "when a song is valid" do
    it "is valid with title and disk_id" do
      song = build(:song)
      expect(song).to be_valid
    end
  end

  context "when a song is invalid" do
    it "is invalid with blank title" do
      song = build(:song, title: "   ")
      expect(song).to_not be_valid
    end

    it "is invalid without disk_id" do
      song = build(:song, disk_id: nil)
      expect(song).to_not be_valid
    end
  end
end
