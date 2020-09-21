class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
    # email.passwordはdeviseで処理してくれるので記述必要なし。記述している分はdeviseになく自分で設定したカラム。
  end
end
