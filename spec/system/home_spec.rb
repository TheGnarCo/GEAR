require "rails_helper"

RSpec.describe "Home Page" do
  context "with unauthenticated visit" do
    it "redirects user to sign in" do
      visit root_path

      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context "with authenticated visit" do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:asset_one) { create(:asset, asset_type: "desk", user:) }
    let!(:asset_two) { create(:asset, user: other_user) }

    before do
      login_as(user)
    end

    it "displays a list of assets" do
      visit root_path

      [asset_one, asset_two].each do |asset|
        expect(page).to have_content asset.asset_type
        expect(page).to have_content asset.user.email
      end
    end
  end
end
