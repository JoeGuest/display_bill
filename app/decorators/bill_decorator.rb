class BillDecorator
  def initialize(bill)
    @bill = bill
  end

  def self.decorate(bill)
    new(bill)
  end

  def statement
    StatementDecorator.decorate(statement_details)
  end

  def total
    bill['total']
  end

  def package
    PackageDecorator.decorate(package_details)
  end

  def call_charges
    CallChargesDecorator.decorate(call_details)
  end

  def sky_store
    SkyStoreDecorator.decorate(sky_store_details)
  end

  private

  attr_reader :bill

  def statement_details
    bill['statement']
  end

  def package_details
    bill['package']
  end

  def call_details
    bill['callCharges']
  end

  def sky_store_details
    bill['skyStore']
  end
end
