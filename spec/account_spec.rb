require "spec_helper"

describe BankTools::AT::Account, "#valid?" do
  it "returns true with no errors" do
    expect(BankTools::AT::Account.new("1234").valid?).to be true
  end

  it "returns false with errors" do
    expect(BankTools::AT::Account.new("123").valid?).to be false
  end

  it "ignores whitespace" do
    expect(BankTools::AT::Account.new("12 34").valid?).to be true
  end

  it "ignores dashes" do
    expect(BankTools::AT::Account.new("12-34").valid?).to be true
  end
end

describe BankTools::AT::Account, "#errors" do
  let(:error_types) { BankTools::AT::Errors }

  it "returns an empty array when valid" do
    expect(BankTools::AT::Account.new("1234").errors).to be_empty
  end

  it "includes TOO_SHORT if the account number is below 4 digits" do
    expect(BankTools::AT::Account.new("123").errors).to include(error_types::TOO_SHORT)
  end

  it "includes TOO_LONG if the account number is above 11 digits" do
    expect(BankTools::AT::Account.new("123456789012").errors).to include(error_types::TOO_LONG)
  end

  it "includes INVALID_CHARACTERS if the account number have any characters besides digits, whitespace and dashes" do
    expect(BankTools::AT::Account.new("1234x").errors).to include(error_types::INVALID_CHARACTERS)
  end
end
