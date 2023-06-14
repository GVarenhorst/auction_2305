require './lib/attendee'
require './lib/item'
require './lib/auction'
RSpec.describe Attendee do
  it "exists and has attributes" do
    attendee = Attendee.new({name: 'Megan', budget: '$50'})

    expect(attendee).to be_a(Attendee)
    expect(attendee.name).to eq("Megan")
    expect(attendee.budget).to eq(50)
  end

  it 'can recognize bidders and returns an array' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    
    expect(auction.bidders).to be eq(['Bob', 'Megan', 'Mike'])
  end

  it 'returns a hash with a budget and bids for the attendee' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expected = {
      @attendee2 => {
        :budget => 75,
        :items => ['Chalkware Piggy Bank', 'Homemade Chocolate Chip Cookies']
      },

      @attendee1 => {
        :budget => 50,
        :items => ['Chalkware Piggy Bank']
      },

    @attendee3 => {
      :budget => 100,
      :items => ['2 Days Dogsitting']
      }
    }
    
    expect(@auction.bidder_info).to eq(expected)
  end
end
