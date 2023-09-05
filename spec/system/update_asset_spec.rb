require "rails_helper"

describe "Updating an Asset", js: true do
  before do
    user = create(:user, first_name: "Amy")
    create(:employee_asset, serial_number: "ZZZZ")
    login_as(user)
  end

  it "allows an existing asset to be updated" do
    visit gnar_employee_assets_path

    click_on "Edit"
    fill_in "Serial number", with: "AAAA"

    click_on "Send it!"

    expect(page).to have_text "AAAA"
  end

  context "if the data is invalid" do
    it "displays an error message" do
      visit gnar_employee_assets_path

      click_on "Edit"
      fill_in "Serial number", with: ""

      click_on "Send it!"

      expect(page).to have_text("Serial number can't be blank")
    end
  end
end
