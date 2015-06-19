class ApplicationController < ActionController::Base
  include Applicationable
  protect_from_forgery with: :exception
end
