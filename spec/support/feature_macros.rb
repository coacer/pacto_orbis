module FeatureMacros
  def user_login_as(user)
    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "Log in"
    expect(page).to have_current_path root_path
    expect(page).to have_link "ログアウト", href: destroy_user_session_path
  end

  def admin_login_as(admin)
    visit new_admin_session_path
    fill_in "メールアドレス", with: admin.email
    fill_in "パスワード", with: admin.password
    click_button "Log in"
    expect(page).to have_current_path admins_root_path
    expect(page).to have_link "ログアウト", href: destroy_admin_session_path
  end
end
