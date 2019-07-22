require 'rails_helper'

RSpec.describe Users::ItemsController, type: :controller do
  let!(:user) { create(:user) }
  let(:item) { create(:item) }

  describe "GET #index" do
    it "returns http success" do
      user_login user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      user_login user
      get :show, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end
  end
end
