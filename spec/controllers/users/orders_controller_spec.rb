require 'rails_helper'

RSpec.describe Users::OrdersController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    it "returns http success" do
      user_login user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      user_login user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
