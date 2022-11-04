require "rails_helper"

RSpec.describe "Authentication", js: true do
  context "when not required" do
    it "allows navigation" do
      visit new_user_session_path

      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
