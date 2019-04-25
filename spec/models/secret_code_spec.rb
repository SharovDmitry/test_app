require 'rails_helper'

RSpec.describe SecretCode, type: :model do
  it 'should be uniq' do
    existing_code = create(:secret_code)
    expect(SecretCode.new(code: existing_code.code)).not_to be_valid
  end
end
