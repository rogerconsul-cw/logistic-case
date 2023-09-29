class ApplicationController < ActionController::Base
  rescue_from StandardError do |exception|
    redirect_to root_path, alert: 'An error occurred.'
  end
end
