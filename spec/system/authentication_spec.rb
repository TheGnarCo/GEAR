require "rails_helper"

RSpec.describe "Authentication", type: :system, js: true do
  context "when not required" do
    it "allows navigation" do
      visit new_user_session_path

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_text("Log in")
    end
  end
end
