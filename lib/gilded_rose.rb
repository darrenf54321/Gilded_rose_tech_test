class GildedRose

  def initialize(items)
    @items = items
  end

  def reduce_sell_in
    @items.each do |item|
      if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
      end
    end
  end

  def update_item_quality
    @items.each do |item|
      if item.quality == 0
        item.quality = 0
      elsif item.sell_in < 0
        item.quality = item.quality - 2
      else item.quality < 50
        item.quality = item.quality - 1
end
      end
  end

  def update_quality
    reduce_sell_in
    update_item_quality
        #

        #   if item.name == "Backstage passes to a TAFKAL80ETC concert"
        #     if item.sell_in < 11

        #       end
        #     end
        #     if item.sell_in < 6
        #       if item.quality < 50
        #         item.quality = item.quality + 1
        #       end
        #     end
        #   end
        # end
end
end

#
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
