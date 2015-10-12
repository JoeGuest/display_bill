require './app/decorators/bill_decorator/sky_store_decorator'

describe SkyStoreDecorator do
  let(:decorator) { SkyStoreDecorator.decorate(sky_store) }
  let(:sky_store) {
    {
      'rentals' => [rental],
      'buyAndKeep' => [buy_and_keep],
      'total' => '100.00'
    }
  }
  let(:rental) {
    {
      'title' => 'film',
      'cost' => '1.23'
    }
  }
  let(:buy_and_keep) {
    {
      'title' => 'tv',
      'cost' => '9.87'
    }
  }

  describe '#rentals' do
    let(:decorated_rentals) { decorator.rentals }

    context 'each rental' do
      let(:decorated_rental) { decorated_rentals.first }

      it 'returns the title' do
        expect(decorated_rental.title).to eql('film')
      end

      it 'returns the cost' do
        expect(decorated_rental.cost).to eql('1.23')
      end
    end
  end

  describe '#buy_and_keep' do
    let(:decorated_purchases) { decorator.buy_and_keep }

    context 'each purchase' do
      let(:decorated_purchase) { decorated_purchases.first }

      it 'returns the title' do
        expect(decorated_purchase.title).to eql('tv')
      end

      it 'returns the cost' do
        expect(decorated_purchase.cost).to eql('9.87')
      end
    end
  end

  describe '#total' do
    it 'returns the total of all Sky Store purchases' do
      expect(decorator.total).to eql('100.00')
    end
  end
end
