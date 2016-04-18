require 'age_item'

class AgeItem::AgedBrie < AgeItem
  def delta_quality
    item.sell_in < 0 ? 2 : 1
  end
end
