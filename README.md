# Austrian bank tools

Ruby gem to validate Austrian bank account numbers.

## Usage

    account = BankTools::AT::Account.new("12345678901")
    account.valid?  # => true
    account.errors  # => []

    bad_account = BankTools::AT::Account.new("1")
    bad_account.valid?  # => false
    bad_account.errors  # => [:too_short]

    blz = BankTools::AT::BLZ.new("12345")
    blz.valid?  # => true
    blz.errors  # => []

    bad_blz = BankTools::AT::BLZ.new("1")
    bad_blz.valid?  # => false
    bad_blz.errors  # => [:too_short]

    # Error codes

    BankTools::AT::Errors::TOO_SHORT                # => :too_short
    BankTools::AT::Errors::TOO_LONG                 # => :too_long
    BankTools::AT::Errors::INVALID_CHARACTERS       # => :invalid_characters

## Tests

    bundle
    rspec # or: rake


## Installation

Add this line to your application's Gemfile:

    gem "banktools-at"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install banktools-at

## TODO

* Use [check digit](http://www.cnb.cz/cs/platebni_styk/iban/download/TR201.pdf)

## Also see

* [Our other BankTools](https://github.com/barsoom?q=banktools)
* [iban-tools](https://github.com/iulianu/iban-tools)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
