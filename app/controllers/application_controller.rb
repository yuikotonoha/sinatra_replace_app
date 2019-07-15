class ApplicationController < ActionController::Base
  # 以下を追記
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ここから
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :image])
  end
  # ここまで追記
end
