require 'rails_helper'

RSpec.feature "Addresses", type: :feature do
  feature "admin" do
    given(:admin) { create(:admin) }
    given(:user) { create(:user, :create_with_addresses) }
    given(:address1) { user.addresses.first }
    given(:address2) { user.addresses.second }
    given(:address3) { user.addresses.third }

    background do
      admin_login_as admin
    end

      scenario "destroy address", js: true do
        visit admins_user_path(user)
        click_link "登録住所一覧"
        expect{
          click_link "削除", href: admins_address_path(address1)
          expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content "住所を削除しました"
        }.to change(Address, :count).by(-1)
      end
  end

  feature "user" do
    given(:user) { create(:user, :create_with_addresses) }
    given(:address1) { user.addresses.first }
    given(:address2) { user.addresses.second }
    given(:address3) { user.addresses.third }

    background do
      user_login_as user
    end

    context "when valid scenario" do
      scenario "edit address via mypage", js: true do
        visit users_users_path
        click_link "登録住所一覧"
        expect(page).to have_content address1.address
        expect(page).to have_content address2.address
        expect(page).to have_content address3.address
        click_link "編集", href: edit_users_address_path(address1)
        fill_in "氏名", with: "山本 三郎"
        fill_in "郵便番号", with: "00110210"
        select "東京都", from: "都道府県"
        fill_in "市区町村", with: "渋谷区"
        fill_in "番地", with: "0000-0000"
        click_button "保存"

        sleep 0.5 # jsのテストのためこれを入れないとパスしたりしなかったりする
        # まだ稀に通らない

        expect(page).to have_current_path users_users_path
        expect(page).to have_content "住所を編集しました"
        click_link "登録住所一覧"
        expect(page).to have_content "東京都 渋谷区 0000-0000"
      end

      scenario "destroy address", js: true do
        visit users_users_path
        click_link "登録住所一覧"
        expect{
          click_link "削除", href: users_address_path(address1)
          expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content "住所を削除しました"
        }.to change(Address, :count).by(-1)
      end
    end
  end
end
