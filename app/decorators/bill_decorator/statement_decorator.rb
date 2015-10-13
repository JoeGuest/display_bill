class StatementDecorator
  def initialize(statement)
    @statement = statement
  end

  def self.decorate(statement)
    new(statement)
  end

  def generated
    display_date(statement['generated'])
  end

  def due
    display_date(statement['due'])
  end

  def period
    BillPeriod.decorate(bill_period_details)
  end

  private
  attr_reader :statement

  def display_date(date)
    parse_date(date).strftime("%d %b")
  end

  def parse_date(date)
    DateTime.parse(date)
  end

  def bill_period_details
    statement['period']
  end

  class BillPeriod < StatementDecorator
    def initialize(bill_period)
      @bill_period = bill_period
    end

    def self.decorate(bill_period)
      new(bill_period)
    end

    def from
      display_date(bill_period['from'])
    end

    def to
      display_date(bill_period['to'])
    end

    private
    attr_reader :bill_period
  end
end
