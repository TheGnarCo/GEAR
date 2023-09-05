require "rails_helper"

RSpec.describe User do
  subject { create(:user) }

  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  describe "#name" do
    let(:email) { "coolpose@example.com" }
    let(:user) { create(:user, first_name:, last_name: "Joestar", email:) }

    describe "when the user has a first name" do
      let(:first_name) { "Jotaro" }

      it "returns the first and last name" do
        expect(user.name).to eq("Jotaro Joestar")
      end
    end

    describe "when the user does not have a first name" do
      let(:first_name) { nil }

      it "returns the email" do
        expect(user.name).to eq(email)
      end
    end
  end
end
