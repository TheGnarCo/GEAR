require "rails_helper"

describe "Retire an Asset", js: true do
  let(:user) { create(:user, first_name: "Amy") }

  before do
    create(:employee_asset, user:, serial_number: "ZZZZ")
    login_as(user)
    visit gnar_user_path(user)
  end

  it "allows an asset to be retired and unretired" do
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
