require "spec_helper"

describe BankTools::AT::BLZ, "#valid?" do
  it "returns true with no errors" do
    expect(BankTools::AT::BLZ.new("12345").valid?).to be true
  end

  it "returns false with errors" do
    expect(BankTools::AT::BLZ.new("1234").valid?).to be false
  end
end

describe BankTools::AT::BLZ, "#errors" do
  let(:error_types) { BankTools::AT::Errors }

  it "returns an empty array when valid" do
    expect(BankTools::AT::BLZ.new("12345").errors).to be_empty
  end

  it "includes TOO_SHORT if the BLZ is below 5 digits" do
    expect(BankTools::AT::BLZ.new("1234").errors).to include(error_types::TOO_SHORT)
  end

  it "includes TOO_LONG if the BLZ is above 5 digits" do
    expect(BankTools::AT::BLZ.new("123456").errors).to include(error_types::TOO_LONG)
  end

  it "includes INVALID_CHARACTERS if the BLZ includes any non-digits" do
    expect(BankTools::AT::BLZ.new("12345x").errors).to include(error_types::INVALID_CHARACTERS)
  end
end
