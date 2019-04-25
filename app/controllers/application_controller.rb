class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, notice: exception.message }
    end
  end

  protected

  def after_sign_in_path_for(resource)
    resource.admin? ? secret_codes_path : root_path
  end
end
