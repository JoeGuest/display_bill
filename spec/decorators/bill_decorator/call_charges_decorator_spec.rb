require './app/decorators/bill_decorator/call_charges_decorator'

describe CallChargesDecorator do
  let(:decorator) { CallChargesDecorator.decorate(call_charges) }
  let(:call_charges) {
    {
      'calls' => [call],
      'total' => '100.00'
    }
  }
  let(:call) {
    {
      'called' => '0123456789',
      'duration' => '00:11:22',
      'cost' => '1.23'
    }
  }

  describe '#calls' do
    let(:decorated_calls) { decorator.calls }

    context 'each call' do
      let(:decorated_call) { decorated_calls.first }

      it 'returns the connected number' do
        expect(decorated_call.called).to eql('0123456789')
      end

      it 'returns the duration' do
        expect(decorated_call.duration).to eql('00:11:22')
      end

      it 'returns the cost' do
        expect(decorated_call.cost).to eql('1.23')
      end
    end
  end

  describe '#total' do
    it 'returns the total of all the calls' do
      expect(decorator.total).to eql('100.00')
    end
  end
end
