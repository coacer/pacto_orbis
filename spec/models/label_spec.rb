require 'rails_helper'

RSpec.describe Label, type: :model do
  context "when a label is valid" do
    it "is valid with name" do
      label = build(:label)
      expect(label).to be_valid
    end
  end

  context "when a label is invalid" do
    it "is invalid without name" do
      label = build(:label, name: "   ")
      expect(label).to_not be_valid
    end
  end
end
