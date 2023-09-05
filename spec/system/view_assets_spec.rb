require "rails_helper"

describe "Viewing assets" do
  before do
    login_as(create(:user, first_name: "Miles", last_name: "Prower",
      email: "gottagofast@example.com"))
  end

  it "displays a list of all assets" do
    asset1 = create(:employee_asset, approximate_purchase_date: Date.new(2022, 7, 20), asset_type: "laptop",
      mac_address: "10", model_number: "1234", serial_number: "ABC")
    asset2 = create(:employee_asset, approximate_purchase_date: Date.new(2023, 8, 31), asset_type: "desk",
      mac_address: "00", model_number: "5678", serial_number: "DEF")

    visit gnar_employee_assets_path

    assets = all(".asset")
    expect(assets[0]).to have_text asset1.asset_type
    expect(assets[0]).to have_text asset1.user.email
    expect(assets[0]).to have_text asset1.model_number
    expect(assets[0]).to have_text asset1.serial_number
    expect(assets[0]).to have_text asset1.approximate_purchase_date

    expect(assets[1]).to have_text asset2.asset_type
    expect(assets[1]).to have_text asset2.user.email
    expect(assets[1]).to have_text asset2.model_number
    expect(assets[1]).to have_text asset2.serial_number
    expect(assets[1]).to have_text asset2.approximate_purchase_date
  end
end
