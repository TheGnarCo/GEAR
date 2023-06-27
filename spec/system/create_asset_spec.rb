require "rails_helper"

describe "Creating an Asset", js: true do
  before { login_as(create(:user, first_name: "Amy")) }

  it "allows a new asset to be created" do
    visit gnar_assets_path

    click_on "Add an Asset"
    select "laptop", from: "Asset type"
    select User.first.email, from: "User"
    fill_in "Approximate purchase date", with: "2022-07-20"
    fill_in "Mac address", with: "00001"
    fill_in "Model number", with: "ABC"
    fill_in "Serial number", with: "1234"

    click_on "Send it!"

    expect(page).to have_text "1234"
  end

  context "if the data is invalid" do
    it "displays an error message" do
      visit gnar_assets_path

      click_on "Add an Asset"

      expect { click_on "Send it!" }.not_to change(Gnar::Asset, :count)
      expect(page).to have_text("User must exist")
      expect(page).to have_text("Serial number can't be blank")
      expect(page).to have_text("Model number can't be blank")
      expect(page).to have_text("Approximate purchase date can't be blank")
    end
  end
end
