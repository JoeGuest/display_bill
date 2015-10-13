require './app/decorators/bill_decorator/sky_store_decorator'

describe SkyStoreDecorator do
  let(:decorator) { SkyStoreDecorator.decorate(sky_store) }
  let(:sky_store) {
    {
      'rentals' => [rental],
      'buyAndKeep' => [buy_and_keep],
      'total' => cost
    }
  }
  let(:rental) {
    {
      'title' => 'film',
      'cost' => cost
    }
  }
  let(:buy_and_keep) {
    {
      'title' => 'tv',
      'cost' => cost
    }
  }
  let(:money) { Money.new(cost, "GBP") }
  let(:cost) { '1.23' }

  describe '#rentals' do
    let(:decorated_rentals) { decorator.rentals }

    context 'each rental' do
      let(:decorated_rental) { decorated_rentals.first }

      it 'returns the title' do
        expect(decorated_rental.title).to eql('film')
      end

      it 'returns the cost' do
        expect(decorated_rental.cost).to eql(money)
      end
    end
  end

  describe '#buy_and_keep' do
    let(:cost) { '9.87' }
    let(:decorated_purchases) { decorator.buy_and_keep }

    context 'each purchase' do
      let(:decorated_purchase) { decorated_purchases.first }

      it 'returns the title' do
        expect(decorated_purchase.title).to eql('tv')
      end

      it 'returns the cost' do
        expect(decorated_purchase.cost).to eql(money)
      end
    end
  end

  describe '#total' do
    let(:cost) { '100.00' }

    it 'returns the total of all Sky Store purchases' do
      expect(decorator.total).to eql(money)
    end
  end
end
