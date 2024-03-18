class ApplicationController < ActionController::Base
   
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActionController::RoutingError, with: :render_not_found

def render_not_found
flash[:alert] = 'Not Found'
redirect_to root_url # or redirect_to some_other_path
end
end
