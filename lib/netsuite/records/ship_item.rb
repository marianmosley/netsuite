module NetSuite
  module Records
    class ShipItem
      include Support::Records
      include Support::Fields

      include Support::Actions
      include Support::RecordRefs

      # https://system.netsuite.com/help/helpcenter/en_US/srbrowser/Browser2014_1/schema/record/currency.html

      actions :get, :get_list, :get_all

      fields :account, :display_name

      attr_reader :internal_id
      attr_accessor :external_id

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)

        initialize_from_attributes_hash(attributes)
      end

    end
  end
end
