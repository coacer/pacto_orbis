require 'rails_helper'

RSpec.describe Users::UsersController, type: :controller do

  before do
    user = create(:user)
    user_login user
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unsubscribe_confirm" do
    it "returns http success" do
      get :unsubscribe_confirm
      expect(response).to have_http_status(:success)
    end
  end

end
