# frozen_string_literal: true

Product.find_or_create_by!(slug: "item-1") { |p| p.name = "Item 1"; p.price = 100 }
Product.find_or_create_by!(slug: "item-2") { |p| p.name = "Item 2"; p.price = 1000 }
Product.find_or_create_by!(slug: "item-3") { |p| p.name = "Item 3"; p.price = 999 }
