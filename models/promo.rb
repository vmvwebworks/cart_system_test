module Promo

  def self.apply(product, quantity)
    case product.promo_code
    when "bogo_promo"
      Promo.bogo_promo(product, quantity)
    when "bulk_promo"
      Promo.bulk_promo(product, quantity)
    when "three_per_two_promo"
      Promo.three_per_two_promo(product, quantity)
    end
  end

  def self.bogo_promo(product, quantity)
    if quantity > 1
      free_products = quantity / 2
      total = (quantity - free_products) * product.price
      {product_code: product.product_code, quantity: quantity, total: total, promo_code: "bogo_promo"}
    else
      total = quantity * product.price
      {product_code: product.product_code, quantity: quantity, total: total, promo_code: nil}
    end
  end

  def self.bulk_promo(product, quantity)
    if quantity >= 3
      total = 4.50 * quantity
      {product_code: product.product_code, quantity: quantity, total: total, promo_code: "bulk_promo"}
    else
      total = quantity * product.price
      {product_code: product.product_code, quantity: quantity, total: total, promo_code: nil}
    end
  end

  def self.three_per_two_promo(product, quantity)
    if quantity >= 3
      free_products = quantity / 3
      total = (quantity - free_products) * product.price
      {product_code: product.product_code, quantity: quantity, total: total, promo_code: "three_per_two_promo"}
    else
      total = quantity * product.price
      {product_code: product.product_code, quantity: quantity, total: total, promo_code: nil}
    end
  end

end
