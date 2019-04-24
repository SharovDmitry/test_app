class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_one :secret_code

  validates :secret_code, presence: { message: 'invalid' }, unless: -> { self.admin? }

  def assign_secret_code(code)
    secret_code = SecretCode.find_by(code: code)

    return unless secret_code_valid?(secret_code)

    self.secret_code = secret_code
  end

  private

  def secret_code_valid?(secret_code)
    secret_code.present? && secret_code.user.nil?
  end
end
