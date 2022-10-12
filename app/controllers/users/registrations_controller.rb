# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).user_status.deliver_now
    flash[:notice]= "User is created."
    redirect_to user_path(@user)
    else 
      flash[:notice]= "User is not created."
      render 'new'
    end
  end

  # GET /resource/edit
  def edit
   @user = User.find(params[:id])
  end

  # PUT /resource
  def update
    @user = User.find_by(email: params[:user][:email])
     if @user.update(user_params)
      flash[:notice]= "User details updated."
      redirect_to user_path(@user)
    else
      flash[:notice]= "User details not updated."
      render 'edit'
    end
  end

  # DELETE /resource
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
private
  def user_params
    params.require(:user).permit(:name, :address, :email, :password, :password_confirmation, :status, :role)
  end
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
 def configure_sign_up_params
      # attribute = [:name, :address]
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :role, :status])
  end
#   # # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :address, :role, :status])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
