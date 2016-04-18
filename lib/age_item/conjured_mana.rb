require 'age_item'

class AgeItem::ConjuredMana < AgeItem
  def delta_quality
    0 < item.sell_in ? -2 : -4
  end
end
