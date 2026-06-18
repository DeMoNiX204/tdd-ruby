class GiftRule

  GIFT_CONDITION = 3
  FREEBIE = 1
  NO_FREEBIE = 0

  def apply (total)
    total >= GIFT_CONDITION ?  FREEBIE : NO_FREEBIE
  end
end