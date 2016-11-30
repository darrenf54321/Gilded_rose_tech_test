class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    sulfuras
    quality_brie
    quality_backstage_pass
    reduce_sell_in
    update_item_quality
  end

  def conjured
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
      if item.name != "Aged Brie"
        if item.quality == 0
          item.quality = 0
        elsif item.sell_in < 0
          item.quality = item.quality - 2
        else item.quality < 50
          item.quality = item.quality - 1
        end
      end
    end
  end

  def quality_brie
    @items.each do |item|
      if item.name == "Aged Brie"
        if item.quality < 50
          item.quality = item.quality + 1
        else
          item.quality = 50
        end
      end
    end
  end

  def quality_backstage_pass
    @items.each do |item|
      if item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.sell_in <= 0
          item.quality = 0
        elsif item.sell_in <= 5
          item.quality = item.quality + 4
        elsif item.sell_in <= 10
          item.quality = item.quality + 3
        elsif item.sell_in < 50
          item.quality = item.quality + 2
        else
          item.quality = 50
        end
      end
    end
  end

  def sulfuras
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        item.quality = item.quality + 1
        item.sell_in = item.sell_in
      end
    end
  end

end
