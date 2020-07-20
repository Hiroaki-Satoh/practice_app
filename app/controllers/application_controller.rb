class ApplicationController < ActionController::Base
# デバイス機能実行前にconfigure_permitted_parametersを実行する。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
  	# 新規登録（sign_up）の際にnameデータの操作を許可する。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
