require 'rails_helper'

RSpec.feature "CartsOrders", type: :feature do
  let(:user) { create(:user) }
  let!(:item) { create(:item, :create_with_disks) }
  let(:user_with_addresses) { create(:user, :create_with_addresses) }

  feature "user" do

    context "when valid scenario" do
      scenario "purchase items by my address" do
        user_login_as user
        visit root_path
        expect(page).to have_content "ようこそ#{user.full_name}さん。"
        click_link "show", href: users_item_path(item)
        expect(page).to have_content item.title

        expect{
          select "3", from: "cart_item_amount" 
          click_button "カートに追加"
          expect(page).to have_current_path users_cart_items_path
          expect(page).to have_content "商品を追加しました"
        }.to change(CartItem, :count).by(1)

        expect(page).to have_content "カート"
        expect(page).to have_content item.title
        expect(page).to have_select "cart_item_amount", selected: "3"
        click_link "購入に進む"
        expect(page).to have_current_path new_users_order_path
        expect(page).to have_content "送付先"
        expect(page).to have_content "お支払い方法"

        expect{
          choose "order_address_0"
          choose "order_payment_0"
          click_button "購入確定"
        }.to change(Order, :count).by(1)

        expect(page).to have_current_path finish_users_orders_path
        expect(page).to have_content "ご注文ありがとうございました"
      end

      scenario "purchase items by other address" do
        user_login_as user_with_addresses
        visit root_path
        expect(page).to have_content "ようこそ#{user.full_name}さん。"
        click_link "show", href: users_item_path(item)
        expect(page).to have_content item.title

        expect{
          select "3", from: "cart_item_amount" 
          click_button "カートに追加"
          expect(page).to have_current_path users_cart_items_path
          expect(page).to have_content "商品を追加しました"
        }.to change(CartItem, :count).by(1)

        expect(page).to have_content "カート"
        expect(page).to have_content item.title
        expect(page).to have_select "cart_item_amount", selected: "3"
        click_link "購入に進む"
        expect(page).to have_current_path new_users_order_path
        expect(page).to have_content "送付先"
        expect(page).to have_content "お支払い方法"

        address_id = user_with_addresses.addresses.first.id
        expect{
          choose "order_address_#{address_id}"
          choose "order_payment_0"
          click_button "購入確定"
        }.to change(Order, :count).by(1)

        expect(page).to have_current_path finish_users_orders_path
        expect(page).to have_content "ご注文ありがとうございました"
      end

      scenario "purchase items by new address" do
        user_login_as user
        visit root_path
        expect(page).to have_content "ようこそ#{user.full_name}さん。"
        click_link "show", href: users_item_path(item)
        expect(page).to have_content item.title

        expect{
          select "3", from: "cart_item_amount" 
          click_button "カートに追加"
          expect(page).to have_current_path users_cart_items_path
          expect(page).to have_content "商品を追加しました"
        }.to change(CartItem, :count).by(1)

        expect(page).to have_content "カート"
        expect(page).to have_content item.title
        expect(page).to have_select "cart_item_amount", selected: "3"
        click_link "購入に進む"
        expect(page).to have_current_path new_users_order_path
        expect(page).to have_content "送付先"
        expect(page).to have_content "お支払い方法"

        expect{
          choose "order_address_-1"
          fill_in "氏名", with: "山田 花子"
          fill_in "郵便番号", with: "00110210"
          select "東京都", from: "都道府県"
          fill_in "市区町村", with: "渋谷区"
          fill_in "番地", with: "0000-0000"
          choose "order_payment_0"
          click_button "購入確定"
        }.to change(Order, :count).by(1).and change(Address, :count).by(1)
        expect(page).to have_current_path finish_users_orders_path
        expect(page).to have_content "ご注文ありがとうございました"
      end
    end

  end

  feature "admin" do

  end

end
