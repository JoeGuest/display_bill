require './app/decorators/bill_decorator/statement_decorator'

describe StatementDecorator do
  let(:decorator) { StatementDecorator.decorate(statement) }
  let(:statement) {
    {
      'generated' => '2015-10-11',
      'due' => '2015-11-11',
      'period' => period
    }
  }
  let(:period) {
    {
      'from' => '2015-09-05',
      'to' => '2015-10-05'
    }
  }

  it 'returns when the bill was generated' do
    expect(decorator.generated).to eql('11 Oct')
  end

  it 'returns when the bill is due' do
    expect(decorator.due).to eql('11 Nov')
  end

  describe '#period' do
    let(:bill_period) { decorator.period }

    it 'returns when the start date' do
      expect(bill_period.from).to eql('05 Sep')
    end

    it 'returns when the end date' do
      expect(bill_period.to).to eql('05 Oct')
    end
  end
end
