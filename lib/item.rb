class Item 
  attr_reader :name
  def initialize(name)
    @bids = Hash.new
    @name = name
  end
end