require 'rails_helper'

RSpec.feature "Items", type: :feature do
  # アーティストデータ生成
  given!(:artist1) { create(:artist) }
  given!(:artist2) { create(:artist) }
  given!(:artist3) { create(:artist) }
  # レーベルデータ生成
  given!(:label1) { create(:label) }
  given!(:label2) { create(:label) }
  given!(:label3) { create(:label) }
  # ジャンルデータ生成
  given!(:genre1) { create(:genre) }
  given!(:genre2) { create(:genre) }
  given!(:genre3) { create(:genre) }
  # 商品データ作成
  given!(:item1) { create(:item, :create_with_disks) }
  given!(:item2) { create(:item, :create_with_disks) }
  given!(:item3) { create(:item, :create_with_disks) }


  # 管理者
  feature "admin" do
    # adminデータ生成
    given(:admin) { create(:admin) }

    background do
      admin_login_as admin
    end

    context "when valid scenario" do
      scenario "create a new item via index page" do
        visit admins_items_path
        click_link "新規作成"
        expect(page).to have_current_path new_admins_item_path
        expect(page).to have_content "商品登録"
        expect{
          select artist2.name, from: "アーティスト"
          fill_in "タイトル", with: "Wherever you are"
          attach_file "ジャケット画像", "#{Rails.root}/spec/files/sample.jpeg"
          fill_in "価格", with: "10969"
          select label3.name, from: "レーベル"
          select genre1.name, from: "ジャンル"
          select "売り切れ", from: "ステータス"
          fill_in "在庫数", with: "30" 
          fill_in "曲名", with: "Wherever you are" 
          click_button "登録"
        }.to change(Item, :count).by(1)

        expect(page).to have_current_path admins_item_path(Item.last)
        expect(page).to have_content artist2.name
        expect(page).to have_content label3.name
        expect(page).to have_content genre1.name
        expect(page).to have_content "10969"
        expect(page).to have_content "30"
        expect(page).to have_content  "商品を作成しました"
        visit current_path
        expect(page).to_not have_content  "商品を作成しました"
      end

      scenario "destroy a item via index page", js: true do
        visit admins_items_path
        click_link "show", href: admins_item_path(item2)
        expect(page).to have_current_path admins_item_path(item2)
        expect(page).to have_content item2.title
        expect{
          click_link "削除"
          expect(page.driver.browser.switch_to.alert.text).to include "本当に削除しますか？"
          # expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？\n商品を削除した場合、購入履歴を表示できなくなる恐れがあります。"
          page.driver.browser.switch_to.alert.accept
          # page.accept_confirm "本当に削除しますか？" #うまくいかない
          expect(page).to have_current_path admins_items_path
        }.to change(Item, :count).by(-1)
      end
    end

    context "when invalid scenario" do
      scenario "create a invalid item" do
        visit new_admins_item_path
        expect(page).to have_content "商品登録"
        expect{
          fill_in "タイトル", with: ""
          fill_in "価格", with: "bbbbb"
          fill_in "在庫数", with: "aaaa" 
          click_button "登録"
        }.to_not change(Item, :count)

        expect(page).to have_current_path admins_items_path
        expect(page).to have_content "商品登録"
        expect(page).to have_content "アーティストを入力してください"
        expect(page).to have_content "レーベルを入力してください"
        expect(page).to have_content "ジャンルを入力してください"
        expect(page).to have_content "タイトルを入力してください"
        expect(page).to have_content "価格は数値で入力してください"
        expect(page).to have_content "在庫数は数値で入力してください"
        expect(page).to have_content "ディスクを入力してください"
      end
    end
  end

 
  # エンドユーザー
  describe "user" do
    given!(:user) { create(:user) }

    background do
      user_login_as user
    end

    context "when valid scenario" do
      scenario "look show page via index" do
        visit users_items_path
        click_link "show", href: users_item_path(item2)
        expect(page).to have_current_path users_item_path(item2)
        expect(page).to have_content item2.title
      end
    end

    context "when invalid scenario" do

    end
  
  end
end
