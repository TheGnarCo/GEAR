require "rails_helper"

RSpec.describe "Authentication", type: :system, js: true do
  context "when not required" do
    it "allows navigation" do
      visit new_user_session_path

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_text("Log in")
    end
  end

  context "when required and user is not signed in" do
    it "redirects user to sign in" do
      visit root_path

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_text("Log in")
    end
  end


  context "when required and user is signed in" do
    before (:each) do
      OmniAuth.config.test_mode = true
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    end

    it "allows navigation" do
      visit new_user_session_path
      click_button "Sign in with GoogleOauth2"

      visit root_path

      expect(page).to have_current_path(root_path)
      expect(page).to have_text("Hello")
    end
  end
end
