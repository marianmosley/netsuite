require 'spec_helper'

describe NetSuite::Records::ShipItem do
  it 'has all the right fields' do
    [
      :display_name, :account
    ].each do |field|
      expect(subject).to have_field(field)
    end
  end
  describe '.get' do
    context 'when the response is successful' do
      let(:response) { NetSuite::Response.new(:success => true, :body => { :display_name => "Carrier Pigeon" }) }

      it 'returns a ShipItem instance populated with the data from the response object' do
        expect(NetSuite::Actions::Get).to receive(:call).with([NetSuite::Records::ShipItem, {:external_id => 1}], {}).and_return(response)
        memo = NetSuite::Records::ShipItem.get(:external_id => 1)
        expect(memo).to be_kind_of(NetSuite::Records::ShipItem)
        expect(memo.display_name).to eql("Carrier Pigeon")
      end
    end
  end
end
