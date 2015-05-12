class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || visits_path
  end

  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
