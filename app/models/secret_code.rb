class SecretCode < ApplicationRecord
  belongs_to :user, optional: true

  validates :code, presence: true, uniqueness: true

  class << self
    def generate(quantity)
      return if quantity < 1

      secret_codes = []
      quantity.times { secret_codes << [uniq_code] }
      SecretCode.import([:code], secret_codes)
    end

    def uniq_code
      code = SecureRandom.urlsafe_base64
      uniq_code if self.exists?(code: code)

      code
    end
  end
end
