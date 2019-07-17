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

  context "when valid scenario" do
    scenario "create a new item" do
      visit new_admins_item_path
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
      # フラッシュメッセージを実装したらテストを書く
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
      # エラーメッセージ表示を実装したらテストを書く
    end
  end
end
