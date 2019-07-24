require 'rails_helper'

RSpec.feature "Users", type: :feature do
  feature "admin" do

  end

  feature "user" do
    let(:user) { create(:user) }

    background do
      user_login_as user
    end
    
    scenario "look show page" do
      visit users_users_path
      expect(page).to have_content user.full_name
      expect(page).to have_content user.kana_full_name
      expect(page).to have_content user.read_postal_code
      expect(page).to have_content user.address
      expect(page).to have_content user.phone
      expect(page).to have_content user.email
    end

    scenario "edit user informations" do
      visit edit_users_users_path 
      fill_in "user_last_name", with: "山本"
      fill_in "user_first_name", with: "三郎"
      fill_in "user_kana_last_name", with: "ヤマモト"
      fill_in "user_kana_first_name", with: "サブロウ"
      fill_in "郵便番号", with: "00110210"
      fill_in "住所", with: "東京都渋谷区0000-0000"
      fill_in "電話番号", with: "00110210000"
      fill_in "メールアドレス", with: "example@feature.com"
      click_button "保存"
      expect(page).to have_content "ユーザー情報を編集しました"
      expect(page).to have_content "山本 三郎"
      expect(page).to have_content "ヤマモト サブロウ"
      expect(page).to have_content "00110210"
      expect(page).to have_content "東京都渋谷区0000-0000"
      expect(page).to have_content "00110210000"
      expect(page).to have_content "example@feature.com"
    end

    scenario "unsubscribe" do
      visit users_users_path
      expect(page).to have_content "ようこそ#{user.full_name}さん"
      click_link "退会"
      expect(page).to have_current_path unsubscribe_confirm_users_users_path
      expect(page).to have_link "Top"
      expect(page).to have_link "退会"
      click_link "退会"
      expect(page).to have_current_path root_path
      expect(page).to have_content "退会しました"
      expect(page).to_not have_content "ようこそ#{user.full_name}さん"
      visit new_user_session_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "Log in"
      expect(page).to have_content "退会したユーザーのメールアドレスです"
      expect(page).to_not have_content "ようこそ#{user.full_name}さん"
    end
  end
end
