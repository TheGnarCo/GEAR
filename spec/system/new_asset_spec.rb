require "rails_helper"

describe "Creating a user", js: true do
  before { login_as(create(:user, first_name: "Tails")) }

  it "allows a new asset to be created" do
    visit gnar_users_path

    expect(page).not_to have_text "lenticer@example.com"

    click_on "Add a Gnarnian"
    fill_in "First name", with: "Larry"
    fill_in "Last name", with: "Enticer"
    fill_in "Email", with: "lenticer@example.com"

    click_on "Create Life!"

    expect(page).to have_text "lenticer@example.com"
  end

  context "if the data is invalid" do
    it "displays an error message" do
      visit gnar_users_path

      click_on "Add a Gnarnian"
      fill_in "Email", with: ""

      expect { click_on "Create Life!" }.not_to change(User, :count)
      expect(page).to have_text("Email can't be blank")
    end
  end
end
