require 'rails_helper'

RSpec.describe Admin, type: :model do
  context "when an admin is valid" do
    it "is valid with email and password" do
      admin = build(:admin)
      expect(admin).to be_valid
    end
  end  

  context "when an admin is invalid" do
    it "is invalid with blank email" do
      admin = build(:admin, email: "   ")
      expect(admin).to_not be_valid
    end

    it "is invalid with blank password" do
      password = "    "
      admin = build(:admin, password: password, password_confirmation: password)
      expect(admin).to_not be_valid
    end

    it "is invalid with different password" do
      admin = build(:admin, password: "aaaaaa", password_confirmation: "bbbbbb")
      expect(admin).to_not be_valid
    end

    it "is invalid with too short password" do
      admin = build(:admin, password: "aaaaa", password_confirmation: "aaaaa")
      expect(admin).to_not be_valid
    end
  end
end
