require 'rails_helper'

RSpec.feature "ArtistsLabelsGenres", type: :feature do
  given!(:admin) { create(:admin) }
  given!(:artist1) { create(:artist) }
  given!(:artist2) { create(:artist) }
  given!(:artist3) { create(:artist) }
  given!(:label1) { create(:label) }
  given!(:label2) { create(:label) }
  given!(:label3) { create(:label) }
  given!(:genre1) { create(:genre) }
  given!(:genre2) { create(:genre) }
  given!(:genre3) { create(:genre) }

  background do
    admin_login_as admin
  end

  context "valid scenario" do
    scenario "create an artist" do
      visit admins_artists_path
      expect(page).to have_content "アーティスト一覧"
      expect(page).to have_content artist1.name
      expect(page).to have_content artist2.name
      expect(page).to have_content artist3.name
      expect{
        fill_in "アーティスト名", with: "ONE OK ROCK"
        click_button "登録"
        expect(page).to have_current_path admins_artists_path
        expect(page).to have_content "アーティストを作成しました"
      }.to change(Artist, :count).by(1)
    end

    scenario "create a label" do
      visit admins_labels_path
      expect(page).to have_content "レーベル一覧"
      expect(page).to have_content label1.name
      expect(page).to have_content label2.name
      expect(page).to have_content label3.name
      expect{
        fill_in "レーベル名", with: "company"
        click_button "登録"
        expect(page).to have_current_path admins_labels_path
        expect(page).to have_content "レーベルを作成しました"
      }.to change(Label, :count).by(1)
    end

    scenario "create a genre" do
      visit admins_genres_path
      expect(page).to have_content "ジャンル一覧"
      expect(page).to have_content genre1.name
      expect(page).to have_content genre2.name
      expect(page).to have_content genre3.name
      expect{
        fill_in "ジャンル名", with: "jazz"
        click_button "登録"
        expect(page).to have_current_path admins_genres_path
        expect(page).to have_content "ジャンルを作成しました"
      }.to change(Genre, :count).by(1)
    end

    scenario "destory an artist", js: true do
      visit admins_artists_path
      expect{
        click_link "削除", href: admins_artist_path(artist1)
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "アーティストを削除しました"
      }.to change(Artist, :count).by(-1)
    end

    scenario "destory an label", js: true do
      visit admins_labels_path
      expect{
        click_link "削除", href: admins_label_path(label1)
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "レーベルを削除しました"
      }.to change(Label, :count).by(-1)
    end

    scenario "destory an genre", js: true do
      visit admins_genres_path
      expect{
        click_link "削除", href: admins_genre_path(genre1)
        expect(page.driver.browser.switch_to.alert.text).to eq "本当に削除しますか？"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "ジャンルを削除しました"
      }.to change(Genre, :count).by(-1)
    end
  end

  context "invalid scenario" do
    scenario "create a blank artist" do
      visit admins_artists_path
      expect{
        fill_in "アーティスト名", with: "   "
        click_button "登録"
        expect(page).to have_current_path admins_artists_path
        expect(page).to have_content "アーティスト名を入力してください"
      }.to_not change(Artist, :count)
    end

    scenario "create a blank label" do
      visit admins_labels_path
      expect{
        fill_in "レーベル名", with: "   "
        click_button "登録"
        expect(page).to have_current_path admins_labels_path
        expect(page).to have_content "レーベル名を入力してください"
      }.to_not change(Label, :count)
    end

    scenario "create a blank genre" do
      visit admins_genres_path
      expect{
        fill_in "ジャンル名", with: "   "
        click_button "登録"
        expect(page).to have_current_path admins_genres_path
        expect(page).to have_content "ジャンル名を入力してください"
      }.to_not change(Genre, :count)
    end
  end
end
