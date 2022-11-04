require "rails_helper"

describe "Viewing users" do
  before do
    login_as(create(:user, first_name: "Pete", last_name: "Weber", email: "pete-weber@example.com"))
  end

  it "displays a list of all users" do
    create(:user, first_name: "Lisa", last_name: "Wagner", email: "lisa-wagner@example.com")
    create(:user, first_name: "W.R.", last_name: "Williams", email: "wr-williams@example.com")

    visit gnar_users_path

    users = all(".user")
    expect(users[0]).to have_text "Lisa"
    expect(users[0]).to have_text "Wagner"
    expect(users[0]).to have_text "lisa-wagner@example.com"
    expect(users[1]).to have_text "Pete"
    expect(users[1]).to have_text "Weber"
    expect(users[1]).to have_text "pete-weber@example.com"
    expect(users[2]).to have_text "W.R."
    expect(users[2]).to have_text "Williams"
    expect(users[2]).to have_text "wr-williams@example.com"
  end
end
