class SecretCodesController < ApplicationController
  authorize_resource

  def index
    @secret_codes = SecretCode.includes(:user)
  end

  def create
    SecretCode.generate(params[:quantity].to_i)

    redirect_to secret_codes_path
  end
end
