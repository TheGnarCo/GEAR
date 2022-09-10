%w[
  nick
  mike
  pete
  alex
  taylor
  greg
  steve.sims
  steve
  steve.zelaznik
  heather
  ethan
  ellis
  bartosz
  sarah.ney
  erik.cameron
  dino
  jhathaway
  nick.marshall
  royce
  will
  ben.olson
  naresh
  ian
  jack
  anthony
  valentine
  jon
].map do |email_slug|
  email = "#{email_slug}@gnar.dog"
  User.where(email:).first_or_create
end

case Rails.env
when "development"
  Asset.first_or_create(
    approximate_purchase_date: Date.new(2022, 7, 21),
    asset_type: "laptop",
    mac_address: "00:25:96:FF:FE:12:34:56",
    model_number: "89734696",
    serial_number: "453h459-kj4h5-7835ae",
    user_id: User.first.id,
  )
end
