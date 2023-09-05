require "rails_helper"

RSpec.describe Gnar::Asset do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "scopes" do
    before do
      create(:asset, model_number: "retired", retired: true)
      create(:asset, model_number: "active", retired: false)
    end

    describe "active" do
      subject(:assets) { described_class.active }

      it "returns active assets" do
        expect(assets.count).to eq(1)
        expect(assets.first.model_number).to eq("active")
      end
    end

    describe "retired" do
      subject(:assets) { described_class.retired }

      it "returns retired assets" do
        expect(assets.count).to eq(1)
        expect(assets.first.model_number).to eq("retired")
      end
    end
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
