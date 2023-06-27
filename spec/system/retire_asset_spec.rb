require "rails_helper"

describe "Retire an Asset", js: true do
  before do
    user = create(:user, first_name: "Amy")
    create(:asset, serial_number: "ZZZZ")
    login_as(user)
  end

  it "allows an asset to be retired and unretired" do
    visit gnar_assets_path

    within("#assets") do
      expect(page).to have_text("ZZZZ")
    end

    within("#retired-assets") do
      expect(page).not_to have_text("ZZZZ")
    end

    click_on "Retire"

    within("#assets") do
      expect(page).not_to have_text("ZZZZ")
    end

    within("#retired-assets") do
      expect(page).to have_text("ZZZZ")
    end

    click_on "UnRetire"

    within("#assets") do
      expect(page).to have_text("ZZZZ")
    end

    within("#retired-assets") do
      expect(page).not_to have_text("ZZZZ")
    end
  end
end
