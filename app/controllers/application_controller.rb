# deviseのコントローラに修正が必要なときは、application_controllerに記述する。
class ApplicationController < ActionController::Base
  # デバイス機能実行前にconfigure_permitted_parametersを実行する。
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしている時のみ実行を許可する
  before_action :authenticate_user!,{ except: [:home, :about] }

  # protected => 他のコントローラで呼び出された場合でも参照できる。
  protected
  # ログイン（sign_in）後の遷移先の変更
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  # 新規登録（sign_up）後の遷移先の変更
  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  # ログアウト（sign_out）後の遷移先の変更
  def after_sign_out_path_for(resource)
    root_path # rootパスへ変更
  end

  def configure_permitted_parameters
  	# 新規登録（sign_up）の際にnameデータの操作を許可する。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
