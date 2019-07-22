module ControllerMacros
  def user_login(user)
    # controller.stub(:authenticate_user!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  def admin_login(admin)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in admin
  end
end
