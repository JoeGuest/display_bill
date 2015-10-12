class CallChargesDecorator
  def initialize(call_charges)
    @call_charges = call_charges
  end

  def self.decorate(call_charges)
    new(call_charges)
  end

  def calls
    call_list.map do |call|
      CallDecorator.decorate(call)
    end
  end

  def total
    call_charges['total']
  end

  private
  attr_reader :call_charges

  def call_list
    call_charges['calls']
  end

  class CallDecorator
    def initialize(call)
      @call = call
    end

    def self.decorate(call)
      new(call)
    end

    def called
      call['called']
    end

    def duration
      call['duration']
    end

    def cost
      call['cost']
    end

    private
    attr_reader :call
  end
end
