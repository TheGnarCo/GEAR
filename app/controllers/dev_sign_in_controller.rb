class DevSignInController < ApplicationController
  def index
    if Rails.env.development?
      @user = User.first_or_create(email: "JortsCat@gnar.dog")
      sign_in_and_redirect @user, event: :authentication
    else
      raise "Can not run in production"
    end
  end
end
