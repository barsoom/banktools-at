require "banktools-at/errors"

module BankTools
  module AT
    class BLZ
      extend AttrExtras.mixin

      LENGTH = 5

      pattr_initialize :original_value

      def valid?
        errors.none?
      end

      def errors
        errors = []

        errors << Errors::TOO_SHORT if compacted_value.length < LENGTH
        errors << Errors::TOO_LONG if compacted_value.length > LENGTH
        errors << Errors::INVALID_CHARACTERS if any_non_digits?

        errors
      end

      private

      def any_non_digits?
        compacted_value.match(/\D/)
      end

      def compacted_value
        original_value.to_s.gsub(/[\s-]/, "")
      end
    end
  end
end
