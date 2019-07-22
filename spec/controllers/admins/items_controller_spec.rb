require 'rails_helper'

RSpec.describe Admins::ItemsController, type: :controller do
  let!(:admin) { create(:admin) }
  let(:item) { create(:item) }

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
      get :show, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      admin_login admin
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      admin_login admin
      get :edit, params: { id: item.id }
      expect(response).to have_http_status(:success)
    end
  end

end
