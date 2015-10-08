module API
  describe Bill do
    let(:uri) { 'http://safe-plains-5453.herokuapp.com/bill.json' }
    let(:bill) { "{\n\"example\":{\n\"key\":\"value\"}}" }

    before do
      allow(Net::HTTP).to receive(:get).
        with(URI(uri)).and_return(bill)
    end

    it 'returns the bill' do
      expect(Bill.get).to eql(JSON.parse(bill))
    end
  end
end
