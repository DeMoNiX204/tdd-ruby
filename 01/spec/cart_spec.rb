require_relative '../lib/cart'
require_relative '../lib/item'

RSpec.describe Cart do
  it'No item, total amount should be 0' do
    cart = Cart.new([])

    expect(cart.total_amount).to eq(0)
    expect(cart.getfreebie).to eq(0)
  end

  it'1 item with price 10, total amount should be 10' do
    cart = Cart.new([Item.new(price: 10, name: 'Apple')])
    expect(cart.total_amount).to eq(10)
    expect(cart.getfreebie).to eq(0)
  end
  it '1 item with price 500 and 400, total amount should be 900' do
    cart = Cart.new(
      [Item.new(price: 500, name: 'Apple'),
      Item.new(price: 400, name: 'Bannana')
    ])  
    
    expect(cart.total_amount).to eq(900)
    expect(cart.getfreebie).to eq(0)
  end

  it '1 item with price 600 and 600, total amount should be 1080' do
    cart = Cart.new(
      [Item.new(price: 600, name: 'Apple'),
      Item.new(price: 600, name: 'Bannana')
    ])  
    
    expect(cart.total_amount).to eq(1080)
    expect(cart.getfreebie).to eq(0)
  end

  it '1 item with price 200 200 and 200, total amount should be 600 and get 1 freebie ' do
    cart = Cart.new(
      [Item.new(price: 200, name: 'Apple'),
      Item.new(price: 200, name: 'Bannana'),
      Item.new(price: 200, name: 'Bannana')
    ])  
    
    expect(cart.total_amount).to eq(600)
    expect(cart.getfreebie).to eq(1)

  end

end