require 'rails_helper'

RSpec.describe Admins::OrdersController, type: :controller do
  let(:admin) { create(:admin) }
  let(:order) { create(:order) }

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
      get :show, params: { id: order }
      expect(response).to have_http_status(:success)
    end
  end

end
