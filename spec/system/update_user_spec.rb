require "rails_helper"

describe "Updating a User", js: true do
  before do
    user = create(:user, first_name: "Amy")
    login_as(user)
  end

  it "allows an existing asset to be updated" do
    visit gnar_users_path

    click_on "Edit"
    fill_in "First name", with: "Aimee"

    click_on "Send it!"

    expect(page).to have_text "Aimee"
  end

  context "if the data is invalid" do
    it "displays an error message" do
      visit gnar_users_path

      click_on "Edit"
      fill_in "Email", with: ""

      click_on "Send it!"

      expect(page).to have_text("Email can't be blank")
    end
  end
end
