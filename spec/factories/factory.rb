FactoryBot.define do
  factory :user do
    email { 'email@example.com' }
    password { 'password' }
    secret_code
  end

  factory :admin, parent: :user do
    email { 'admin@example.com' }
    admin { true }
  end

  factory :secret_code do
    code { SecretCode.uniq_code }
  end
end