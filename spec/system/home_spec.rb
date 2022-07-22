require "rails_helper"

RSpec.describe "Home Page", type: :system do
  context "When not authenticated" do
    it "redirects user to sign in" do
      visit root_path

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_text("Log in")
    end
  end

  context "When authenticated" do
    let!(:user) { create :user }
    let!(:other_user) { create :user }
    let!(:asset_1) { create :asset, asset_type: "desk", user: }
    let!(:asset_2) { create :asset, user: other_user }

    before :each do
      login_as(user)
    end

    it "displays a list of assets" do
      visit root_path

      [asset_1, asset_2].each do |asset|
        expect(page).to have_content asset.asset_type
        expect(page).to have_content asset.user.email
      end
    end
  end
end
