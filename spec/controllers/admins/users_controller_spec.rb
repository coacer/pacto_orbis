require 'rails_helper'

RSpec.describe Admins::UsersController, type: :controller do
  let!(:admin) { create(:admin) }
  let(:user) { create(:user) }

  describe "GET #index" do
    it "returns http success" do
      admin_login admin
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      admin_login admin
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      admin_login admin
      get :edit, params: { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

end
