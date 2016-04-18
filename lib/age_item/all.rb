require 'age_item/aged_brie'
require 'age_item/backstage_pass'
require 'age_item/conjured_mana'
require 'age_item/normal'
require 'age_item/sulfuras'

class AgeItem
  agers['Aged Brie']                                 = AgedBrie
  agers['Backstage passes to a TAFKAL80ETC concert'] = BackstagePass
  agers['Sulfuras, Hand of Ragnaros']                = Sulfuras
  agers['NORMAL ITEM']                               = Normal
  agers['Conjured Mana Cake']                        = ConjuredMana
end
