require 'rails_helper'

RSpec.describe Users::CartItemsController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    it "returns http success" do
      user_login user
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
