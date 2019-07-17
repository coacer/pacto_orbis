require 'rails_helper'

RSpec.feature "Items", type: :feature do
  context "when valid scenario" do
    scenario "create a new item" do
      visit new_admins_item_path
      expect(page).to have_content "商品登録"
    end
  end

  context "when invalid scenario" do
    
  end
end
