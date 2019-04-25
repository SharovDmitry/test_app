require 'rails_helper'

describe Users::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it 'should create user with valid secret code' do
    params = {
      user: {
        email: 'email@example.com',
        password: 'password'
      },
      secret_code: create(:secret_code).code
    }

    expect { post :create, params: params }.to change { User.count }.by(1)
    expect(response).to have_http_status(:redirect)
  end

  it 'should not create user with invalid secret code' do
    params = {
      user: {
        email: 'email@example.com',
        password: 'password'
      },
      secret_code: '123'
    }
    expect { post :create, params: params }.not_to change { User.count }
  end
end
