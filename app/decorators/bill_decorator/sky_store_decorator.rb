class SkyStoreDecorator
  def initialize(sky_store)
    @sky_store = sky_store
  end

  def self.decorate(sky_store)
    new(sky_store)
  end

  def rentals
    rentals_list.map do |rental|
      MediaItem.decorate(rental)
    end
  end

  def buy_and_keep
    buy_and_keep_list.map do |buy_and_keep|
      MediaItem.decorate(buy_and_keep)
    end
  end

  def total
    sky_store['total']
  end

  private
  attr_reader :sky_store

  def rentals_list
    sky_store['rentals']
  end

  def buy_and_keep_list
    sky_store['buyAndKeep']
  end

  class MediaItem
    def initialize(item)
      @item = item
    end

    def self.decorate(item)
      new(item)
    end

    def title
      item['title']
    end

    def cost
      item['cost']
    end

    private
    attr_reader :item
  end
end
