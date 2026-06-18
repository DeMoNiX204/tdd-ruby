class DiscountRule

  CONDITION_PRICE = 1000 
  DISSCOUND_RATE = 0.9

  def apply (total)
    total >= CONDITION_PRICE ? total * DISSCOUND_RATE : total
  end
end