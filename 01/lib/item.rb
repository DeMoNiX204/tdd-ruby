class Item
  attr_reader :price, :name

  def initialize(price:,name:)
    raise 'Price must be positive' if price < 0
    @price = price
    @name = name
  end
end