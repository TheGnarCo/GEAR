class AuthenticatedController < ApplicationController
  layout "application"
  before_action :authenticate_user!
end
