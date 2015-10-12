class StatementDecorator
  def initialize(statement)
    @statement = statement
  end

  def self.decorate(statement)
    new(statement)
  end

  def generated
    statement['generated']
  end

  def due
    statement['due']
  end

  def period
    BillPeriod.decorate(bill_period_details)
  end

  private
  attr_reader :statement

  def bill_period_details
    statement['period']
  end

  class BillPeriod
    def initialize(bill_period)
      @bill_period = bill_period
    end

    def self.decorate(bill_period)
      new(bill_period)
    end

    def from
      bill_period['from']
    end

    def to
      bill_period['to']
    end

    private
    attr_reader :bill_period
  end
end
