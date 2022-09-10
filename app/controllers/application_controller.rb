class ApplicationController < ActionController::Base
  layout "unauthenticated"
  def new_session_path(_scope)
    new_user_session_path
  end
end
