require 'age_item/sulfuras'

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
