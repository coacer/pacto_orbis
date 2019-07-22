require 'rails_helper'

RSpec.feature "Devises", type: :feature do
  feature "admin" do
    context "when vaild" do
      given(:admin) { create(:admin) }

      scenario "signin as admin" do
        visit new_admin_session_path
        fill_in "メールアドレス", with: admin.email
        fill_in "パスワード", with: admin.password
        click_button "Log in"
        expect(page).to have_current_path admins_root_path
        expect(page).to have_link "ログアウト", href: destroy_admin_session_path
        visit users_users_path
        expect(page).to_not have_current_path users_users_path
      end
    end
  end

  feature "user" do
    context "when vaild" do
      given(:user) { create(:user) }

      scenario "signin as user" do
        visit new_user_session_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        click_button "Log in"
        expect(page).to have_current_path root_path
        expect(page).to have_link "ログアウト", href: destroy_user_session_path
        visit admins_root_path
        expect(page).to_not have_current_path admins_root_path
      end

      scenario "signin as user friendly forwarding" do
        item = create(:item, :create_with_disks)

        visit root_path
        click_link "マイページ"
        expect(page).to have_current_path new_user_session_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        click_button "Log in"
        expect(page).to have_current_path users_users_path
        expect(page).to have_link "ログアウト", href: destroy_user_session_path
      end
    end
  end
end
