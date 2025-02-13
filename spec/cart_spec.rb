RSpec.describe Cart do
  let(:green_tea) { Product.new("GR1", "Green Tea", 3.11, "bogo_promo") }
  let(:strawberries) { Product.new("SR1", "Strawberries", 5.00, "bulk_promo") }
  let(:coffee) { Product.new("CF1", "Coffee", 11.23, "three_per_two_promo") }

  it "calculate sample for GR1,SR1,GR1,GR1,CF1" do
    cart = Cart.new
    cart.scan(green_tea)
    cart.scan(strawberries)
    cart.scan(green_tea)
    cart.scan(green_tea)
    cart.scan(coffee)
    expect(cart.check_out).to eq(22.45)
  end

  it "calculate sample for GR1,GR1" do
    cart = Cart.new
    cart.scan(green_tea)
    cart.scan(green_tea)
    expect(cart.check_out).to eq(3.11)
  end

  it "calculate sample for SR1,SR1,GR1,SR1" do
    cart = Cart.new
    cart.scan(strawberries)
    cart.scan(strawberries)
    cart.scan(green_tea)
    cart.scan(strawberries)
    expect(cart.check_out).to eq(16.61)
  end

  it "calculate sample for GR1,CF1,SR1,CF1,CF1" do
    cart = Cart.new
    cart.scan(green_tea)
    cart.scan(coffee)
    cart.scan(strawberries)
    cart.scan(coffee)
    cart.scan(coffee)
    expect(cart.check_out).to eq(30.57)
  end
end
