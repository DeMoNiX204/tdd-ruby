require_relative '../lib/item'

RSpec.describe Cart do
  it'Give item have minus price should be ' do
    expect{
      Item.new(price: -10, name: 'Apple')
  }.to raise_error(RuntimeError, 'Price must be positive')
  end

end