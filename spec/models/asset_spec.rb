require "rails_helper"

RSpec.describe Asset, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:model_number) }
    it { should validate_presence_of(:serial_number) }
    it { should validate_presence_of(:approximate_purchase_date) }
    it { should validate_presence_of(:phone_number) }
  end

  describe "enums" do
    it {
      should define_enum_for(:asset_type).with_values({
        laptop: 0,
        display: 1,
        keyboard: 2,
        mouse: 3,
        power_supply: 4,
        desk: 5,
        chair: 6,
      })
    }
  end
end
