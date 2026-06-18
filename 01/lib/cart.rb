require_relative 'discount_rule'
require_relative 'gift_rule'
class Cart

  def initialize(item)
    @item = item
    @discount_rule = DiscountRule.new
    @gift_rule = GiftRule.new

  end
  def total_amount
    total = @item.sum(&:price)
    @discount_rule.apply(total)
    
  end

  def getfreebie
    total = @item.count
    @gift_rule.apply(total)
  end
end