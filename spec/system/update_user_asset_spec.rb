require "rails_helper"

describe "Updating a user's Assets", js: true do
  before do
    user = create(:user, first_name: "Amy")
    create(:asset, user:, serial_number: "ZZZZ")
    login_as(user)
    visit gnar_user_path(user)
  end

  it "allows an existing asset to be updated" do
    click_on "Edit"
    fill_in "Serial number", with: "AAAA"

    click_on "Send it!"

    expect(page).to have_text "AAAA"
  end

  context "if the data is invalid" do
    it "displays an error message" do
      click_on "Edit"
      fill_in "Serial number", with: ""

      click_on "Send it!"

      expect(page).to have_text("Serial number can't be blank")
    end
  end
end
