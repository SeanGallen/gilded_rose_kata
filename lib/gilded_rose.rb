def update_quality(items)
  items.each { |item| AgeItem.call item }
end

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

class AgeItem::AgedBrie < AgeItem
  def delta_quality
    item.sell_in < 0 ? 2 : 1
  end
end


class AgeItem::BackstagePass < AgeItem
  def delta_quality
    return -item.quality if item.sell_in < 0
    return 3             if item.sell_in < 5
    return 2             if item.sell_in < 10
    return 1
  end
end


class AgeItem::Sulfuras < AgeItem
  def delta_sell_in
    0
  end
  def delta_quality
    0
  end
  def max_quality
    item.quality
  end
  def min_quality
    item.quality
  end
end


class AgeItem::Normal < AgeItem
  def delta_quality
    item.sell_in < 0 ? -2 : -1
  end
end


class AgeItem::ConjuredMana < AgeItem
  def delta_quality
    0 < item.sell_in ? -2 : -4
  end
end


class AgeItem
  agers['Aged Brie']                                 = AgedBrie
  agers['Backstage passes to a TAFKAL80ETC concert'] = BackstagePass
  agers['Sulfuras, Hand of Ragnaros']                = Sulfuras
  agers['NORMAL ITEM']                               = Normal
  agers['Conjured Mana Cake']                        = ConjuredMana
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
