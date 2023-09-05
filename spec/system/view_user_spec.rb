require "rails_helper"

describe "Viewing user" do
  before do
    login_as(create(:user, first_name: "Pete", last_name: "Weber", email: "pete-weber@example.com"))
  end

  it "displays a list of all of the given users assets" do
    user = create(:user, first_name: "Karl", last_name: "Havoc",
      email: "idontevenwannabearoundanymore@example.com")
    asset_1 = create(:asset, user:, model_number: "00001")
    asset_2 = create(:asset, user:, model_number: "00002")

    other_user = create(:user, first_name: "Brett Hartley", last_name: "Jarvis",
      email: "badboy@example.com")
    other_asset_1 = create(:asset, user: other_user, model_number: "x0001")
    other_asset_2 = create(:asset, user: other_user, model_number: "x0002")

    visit gnar_user_path(user)

    assets = all(".asset")
    expect(assets[0]).to have_text asset_1.model_number
    expect(assets[1]).to have_text asset_2.model_number

    expect(page).not_to have_text other_asset_1.model_number
    expect(page).not_to have_text other_asset_2.model_number
  end
end
