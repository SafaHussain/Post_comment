class ApplicationController < ActionController::Base 
  before_action :authenticate_user!

  #  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
  #  before_action :configure_account_update_params, only: [:update], if: :devise_controller?

   
    protected

 # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   # attribute = [:name, :address]
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
  # end

  # # # # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address])
  # end

end
