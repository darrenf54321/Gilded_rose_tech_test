require 'gilded_rose'
require 'item'

describe GildedRose do

  # All items have a SellIn value which denotes the number of days we have to sell the item All items have a Quality value which denotes how valuable the item is At the end of each day our system lowers both values for every item

  it "does not change the name" do
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].name).to eq "foo"
  end


  it "each day reduces the sell_in by 1" do
    items = [Item.new("foo", 5, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].sell_in).to eq 4
  end

  # Once the sell by date has passed, Quality degrades twice as fast
  it 'the Quality reduces by x2 if the sell_in is less than o' do
    items = [Item.new("foo", -3, 10)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 8
  end

  # The Quality of an item is never negative
  it "the Quality of an item is never negative" do
    items = [Item.new("foo", 3, 0)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 0
  end

  #“Aged Brie” actually increases in Quality the older it gets
  it "Aged Brie Quality increases the older it gets" do
    items = [Item.new("Aged Brie", 3, 5)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 6
  end

  #The Quality of an item is never more than 50
  it "the Quality of an item is never greater than 50" do
    items = [Item.new("Aged Brie", 3, 50)]
    GildedRose.new(items).update_quality
    expect(items[0].quality).to eq 50
  end
end

#“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
describe "#Sulfuras" do
  context 'when item is Sulfuras' do
    it "never has to be sold" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 1
    end

    it "never decreases in quality" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 1
    end
  end
end

#“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches
describe "#Backstage Pass" do
  context "when item is a Backstage Pass" do
    it "the Quality increases as the sell_in approaches" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 25, 4)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 5
    end

    it "the Quality increases by by 3 when there are 5 days of sell_in or less" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 2, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
    end

    it "the Quality increases by by 2 when there are 10 days of sell_in or less (but more than 5)" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 15)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 17
    end

    it 'Quality drops to 0 when the concert has past' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 45)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end
end
