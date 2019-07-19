require 'rails_helper'

RSpec.describe Disk, type: :model do
  context "when a disk is valid" do
    it "is valid with item_id" do
      disk = build(:disk)
      expect(disk).to be_valid
    end
  end

  context "when a disk is invalid" do
    it "is invalid without item_id" do
      disk = build(:disk, item_id: nil)
      expect(disk).to_not be_valid
    end
  end
end
