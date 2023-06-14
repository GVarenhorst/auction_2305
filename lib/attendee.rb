class Attendee
  attr_reader :name,
              :budget

  def initialize(info)
    @name = info[:name]
    @budget = info[:budget]
  end

  def budget
    @budget.delete('$').to_i
  end

  def bidders
    names = []
    items.each do |item|
      items.bids.each do |bid|
        names << bid[0].name
      end
    end
    names.uniq
  end

  def bidder_info
    bidder_info = Hash.new()
    items.each do |item|
      item.bids.each do |bid|
        bidder_info[bid[0]] = {}
      end
    end
    bidder_info.each do |key, value|
      items.each do |item|
        value[:budget] = key.budget
        if item.bids.keys.include?(key)
          if value[:items] == nil
            value[:items] = [item.name]
          else
            value[:items] += [item.name]
          end
        end
      end
    end
  end
end