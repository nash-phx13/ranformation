class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :reject_inactive_user, only: [:create]

  private

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end


  def reject_inactive_user
    @user = User.find_by( email: params[:user][:email].downcase)
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_active  == false
        flash[:error] = "退会済みです。"
        redirect_to new_user_session_path
      end
      else
      flash[:error] = "必須項目を入力してください。"
    end
  end
