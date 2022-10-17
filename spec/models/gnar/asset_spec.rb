require "rails_helper"

RSpec.describe Gnar::Asset, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:model_number) }
    it { is_expected.to validate_presence_of(:serial_number) }
    it { is_expected.to validate_presence_of(:approximate_purchase_date) }
  end

  describe "enums" do
    subject(:asset) { create(:asset) }

    enum_values = {
      laptop: "laptop",
      display: "display",
      keyboard: "keyboard",
      mouse: "mouse",
      power_supply: "power supply",
      desk: "desk",
      chair: "chair",
    }

    it do
      expect(asset).to define_enum_for(:asset_type)
        .with_values(enum_values)
        .backed_by_column_of_type(:enum)
    end
  end
end
