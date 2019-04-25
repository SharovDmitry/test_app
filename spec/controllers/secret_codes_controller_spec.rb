require 'rails_helper'

describe SecretCodesController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @user = create(:user)
    @admin = create(:admin)
  end

  context 'admin' do
    before do
      sign_in @admin
    end

    it 'should create secret codes' do
      expect { post :create, params: { quantity: 10 } }.to change { SecretCode.count }.by(10)
      expect(response).to have_http_status(:redirect)
    end

    it 'should allow to visit index page' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  context 'user' do
    before do
      sign_in @user
    end

    it 'should not create secret codes' do
      expect { post :create, params: { quantity: 10 } }.not_to change { SecretCode.count }
    end


    it 'should not allow to visit index page' do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end
end
