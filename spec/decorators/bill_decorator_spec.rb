require './app/decorators/bill_decorator'
require './app/decorators/bill_decorator/statement_decorator'
require './app/decorators/bill_decorator/package_decorator'
require './app/decorators/bill_decorator/call_charges_decorator'
require './app/decorators/bill_decorator/sky_store_decorator'

describe BillDecorator do
  let(:decorator) { BillDecorator.decorate(bill) }
  let(:bill) {
    {
      'statement' => 'statement',
      'total' => '100.00',
      'package' => 'subscriptions',
      'callCharges' => 'calls',
      'skyStore' => 'purchases'
    }
  }

  describe '#statement' do
    let(:decorated_statement) { double('StatementDecorator') }

    before do
      allow(StatementDecorator).to receive(:decorate).
        with(bill['statement']).
        and_return(decorated_statement)
    end

    it 'decorates the statement' do
      expect(decorator.statement).to eql(decorated_statement)
    end
  end

  describe '#total' do
    it 'returns the total bill price' do
      expect(decorator.total).to eql(Money.new(100, "GBP"))
    end
  end

  describe '#package' do
    let(:decorated_package) { double('PackageDecorator') }

    before do
      allow(PackageDecorator).to receive(:decorate).
        with(bill['package']).
        and_return(decorated_package)
    end

    it 'decorates the package' do
      expect(decorator.package).to eql(decorated_package)
    end
  end

  describe '#call_charges' do
    let(:decorated_call_charges) { double('CallChargesDecorator') }

    before do
      allow(CallChargesDecorator).to receive(:decorate).
        with(bill['callCharges']).
        and_return(decorated_call_charges)
    end

    it 'decorates the call charges' do
      expect(decorator.call_charges).to eql(decorated_call_charges)
    end
  end

  describe '#sky_store' do
    let(:decorated_sky_store) { double('SkyStoreDecorator') }

    before do
      allow(SkyStoreDecorator).to receive(:decorate).
        with(bill['skyStore']).
        and_return(decorated_sky_store)
    end

    it 'decorates the sky store' do
      expect(decorator.sky_store).to eql(decorated_sky_store)
    end
  end
end
