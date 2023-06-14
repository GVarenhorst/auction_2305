require './lib/item'
require './lib/attendee'
require './lib/auction'
RSpec.describe Item do
  it "exists and has attributes" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    expect(item1).to be_a(Item)
    expect(item1.name).to eq("Chalkware Piggy Bank")
  end

  it "can add bids" do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    expect(item1.bids).to eq({})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    

    expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    expect(item1.current_high_bid).to eq(22)
  end
end
