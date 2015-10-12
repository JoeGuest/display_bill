class PackageDecorator
  def initialize(package)
    @package = package
  end

  def self.decorate(package)
    new(package)
  end

  def subscriptions
    subscription_list.map do |subscription|
      SubscriptionDecorator.decorate(subscription)
    end
  end

  def total
    package['total']
  end

  private
  attr_reader :package

  def subscription_list
    package['subscriptions']
  end

  class SubscriptionDecorator
    def initialize(subscription)
      @subscription = subscription
    end

    def self.decorate(subscription)
      new(subscription)
    end

    def type
      subscription['type']
    end

    def name
      subscription['name']
    end

    def cost
      subscription['cost']
    end

    private
    attr_reader :subscription
  end
end
