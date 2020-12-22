class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :email,
      ])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:email])
  end

  def after_sign_in_path_for(resource)
    case resource
     when Senior
       posts_path
     when Junior
       juniors_seniors_path
    end
  end
end
