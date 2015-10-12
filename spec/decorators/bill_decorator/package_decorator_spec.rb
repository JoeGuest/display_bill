require './app/decorators/bill_decorator/package_decorator'

describe PackageDecorator do
  let(:decorator) { PackageDecorator.decorate(package) }
  let(:package) {
    {
      'subscriptions' => [subscription],
      'total' => '100.00'
    }
  }
  let(:subscription) {
    {
      'type' => 'tv',
      'name' => 'tv show',
      'cost' => '1.23'
    }
  }

  describe '#subscriptions' do
    let(:decorated_subscriptions) { decorator.subscriptions }

    context 'each package' do
      let(:decorated_subscription) { decorated_subscriptions.first }

      it 'returns its type' do
        expect(decorated_subscription.type).to eql('tv')
      end

      it 'returns its name' do
        expect(decorated_subscription.name).to eql('tv show')
      end

      it 'returns its cost' do
        expect(decorated_subscription.cost).to eql('1.23')
      end
    end
  end

  describe '#total' do
    it 'returns the total of all subscriptions' do
      expect(decorator.total).to eql('100.00')
    end
  end
end
