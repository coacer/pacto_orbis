require 'rails_helper'

RSpec.feature "Users", type: :feature do
  given!(:user1) { create(:user) }

  feature "admin" do
    given(:admin) { create(:admin) }
    given!(:user2) { create(:user) }
    given!(:user3) { create(:user) }

    background do
      admin_login_as admin
    end

    scenario "look show page via index page" do
      visit admins_users_path
      expect(page).to have_content "ユーザー一覧"
      expect(page).to have_content user1.full_name
      expect(page).to have_content user2.full_name
      expect(page).to have_content user3.full_name
      click_link "詳細", href: admins_user_path(user1)
      expect(page).to have_current_path admins_user_path(user1)
      expect(page).to have_content user1.full_name
      expect(page).to have_content user1.kana_full_name
      expect(page).to have_content user1.read_postal_code
      expect(page).to have_content user1.address
      expect(page).to have_content user1.phone
      expect(page).to have_content user1.email
    end

    scenario "edit user informations" do
      visit edit_admins_user_path(user1)
      fill_in "user_last_name", with: "山本"
      fill_in "user_first_name", with: "三郎"
      fill_in "user_kana_last_name", with: "ヤマモト"
      fill_in "user_kana_first_name", with: "サブロウ"
      fill_in "郵便番号", with: "00110210"
      select "東京都", from: "都道府県"
      fill_in "市区町村", with: "渋谷区"
      fill_in "番地", with: "0000-0000"
      fill_in "電話番号", with: "00110210000"
      fill_in "メールアドレス", with: "example@feature.com"
      click_button "保存"
      expect(page).to have_content "ユーザー情報を編集しました"
      expect(page).to have_content "山本 三郎"
      expect(page).to have_content "ヤマモト サブロウ"
      expect(page).to have_content "00110210"
      expect(page).to have_content "東京都 渋谷区 0000-0000"
      expect(page).to have_content "00110210000"
      expect(page).to have_content "example@feature.com"
    end

    scenario "destroy user", js: true do
      visit admins_user_path(user1)
      expect{
        click_link "削除" 
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "ユーザーを削除しました"
      }.to change(User, :count).by(-1)
    end

  end

  feature "user" do

    background do
      user_login_as user1
    end

    scenario "look show page" do
      visit users_users_path
      expect(page).to have_content user1.full_name
      expect(page).to have_content user1.kana_full_name
      expect(page).to have_content user1.read_postal_code
      expect(page).to have_content user1.address
      expect(page).to have_content user1.phone
      expect(page).to have_content user1.email
    end

    scenario "edit user informations" do
      visit edit_users_users_path 
      fill_in "user_last_name", with: "山本"
      fill_in "user_first_name", with: "三郎"
      fill_in "user_kana_last_name", with: "ヤマモト"
      fill_in "user_kana_first_name", with: "サブロウ"
      fill_in "郵便番号", with: "00110210"
      select "東京都", from: "都道府県"
      fill_in "市区町村", with: "渋谷区"
      fill_in "番地", with: "0000-0000"
      fill_in "電話番号", with: "00110210000"
      fill_in "メールアドレス", with: "example@feature.com"
      click_button "保存"
      expect(page).to have_content "ユーザー情報を編集しました"
      expect(page).to have_content "山本 三郎"
      expect(page).to have_content "ヤマモト サブロウ"
      expect(page).to have_content "00110210"
      expect(page).to have_content "東京都 渋谷区 0000-0000"
      expect(page).to have_content "00110210000"
      expect(page).to have_content "example@feature.com"
    end

    scenario "unsubscribe" do
      visit users_users_path
      expect(page).to have_content "ようこそ#{user1.full_name}さん"
      click_link "退会"
      expect(page).to have_current_path unsubscribe_confirm_users_users_path
      expect(page).to have_link "Top"
      expect(page).to have_link "退会"
      click_link "退会"
      expect(page).to have_current_path root_path
      expect(page).to have_content "退会しました"
      expect(page).to_not have_content "ようこそ#{user1.full_name}さん"
      visit new_user_session_path
      fill_in "メールアドレス", with: user1.email
      fill_in "パスワード", with: user1.password
      click_button "Log in"
      expect(page).to have_content "退会したユーザーのメールアドレスです"
      expect(page).to_not have_content "ようこそ#{user1.full_name}さん"
    end
  end
end
