require 'money'

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
    money(package['total'])
  end

  private
  attr_reader :package

  def money(number)
    Money.new(number * 100, "GBP")
  end

  def subscription_list
    package['subscriptions']
  end

  class SubscriptionDecorator < PackageDecorator
    def initialize(subscription)
      @subscription = subscription
    end

    def self.decorate(subscription)
      new(subscription)
    end

    def type
      upcase_or_capitalize(subscription['type'])
    end

    def name
      subscription['name']
    end

    def cost
      money(subscription['cost'])
    end

    private
    attr_reader :subscription

    def upcase_or_capitalize(string)
      string == 'tv' ? string.upcase : string.capitalize
    end
  end
end
