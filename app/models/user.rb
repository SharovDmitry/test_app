class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_one :secret_code

  validates :secret_code, presence: true, unless: -> { self.admin? }
end
