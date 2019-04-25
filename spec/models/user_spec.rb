require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(email: 'test@test.com', password: 'password')
  end

  it 'should creates without secret code if admin' do
    @user.admin = true
    expect(@user).to be_valid
  end

  it 'should not creates without secret code if not admin' do
    expect(@user).not_to be_valid
  end

  it 'should creates with secret code if not admin' do
    @user.secret_code = create(:secret_code)
    expect(@user).to be_valid
  end
end
