require 'age_item'

class AgeItem::BackstagePass < AgeItem
  def delta_quality
    return -item.quality if item.sell_in < 0
    return 3             if item.sell_in < 5
    return 2             if item.sell_in < 10
    return 1
  end
end
