require_relative 'models/promo'
require_relative 'models/cart'
require_relative 'models/product'

require 'pry'
pera = Product.new("pera", "pera verde", 2.5, "bulk_promo")
cart = Cart.new