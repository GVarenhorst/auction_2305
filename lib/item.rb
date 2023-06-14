class Item 
  attr_reader :name,
              :bids

  def initialize(name)
    @bids = Hash.new(0)
    @name = name
  end

  def add_bid(bidder, bid)
    @bids[bidder] = bid
  end
end