module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # Reference: https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview#facebook-example
    skip_before_action :verify_authenticity_token, only: :google_oauth2

    def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
        sign_in_and_redirect @user, event: :authentication
      else
        remove_extra_to_prevent_session_store_overflow
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end

    private

    def remove_extra_to_prevent_session_store_overflow
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
    end
  end
end
