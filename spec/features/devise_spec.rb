require 'rails_helper'

RSpec.feature "Devises", type: :feature do
  feature "admin" do
    context "when vaild" do
      let(:admin) { create(:admin) }

      it "signin as admin" do
        visit new_admin_session_path
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_button "Log in"
        expect(page).to have_current_path admins_root_path
        expect(page).to have_link "ログアウト", href: destroy_admin_session_path
      end
    end
  end

  feature "user" do

  end
end
