class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.select do |item|
    item.bids.empty?
    end
  end

  def potential_revenue
    high_total = 0
    @items.each do |item|
      if item.current_high_bid != nil
        high_total += item.current_high_bid
      end
    end
    high_total
  end
end