require 'rails_helper'

RSpec.describe Users::AddressesController, type: :controller do

  describe "GET #edit" do
    let(:user) { create(:user, :create_with_addresses) }
    it "returns http success" do
      user_login user
      get :edit, params: { id: user.addresses.first }
      expect(response).to have_http_status(:success)
    end
  end

end
