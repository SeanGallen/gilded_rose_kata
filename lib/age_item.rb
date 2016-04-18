class AgeItem
  # You can extend functionality by adding agers
  @agers = {}
  def self.agers
    @agers
  end

  def self.call(item)
    agers[item.name].new(item).age
  end

  # AgeItem is a superclass for other agers, they can override as appropriate
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def delta_sell_in
    -1
  end

  def delta_quality
    raise 'implement me'
  end

  def max_quality
    50
  end

  def min_quality
    0
  end

  def age
    item.sell_in += delta_sell_in
    item.quality += delta_quality
    item.quality = max_quality if max_quality  < item.quality
    item.quality = min_quality if item.quality < min_quality
  end
end
