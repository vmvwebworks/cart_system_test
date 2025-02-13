RSpec.describe Promo do
  let(:product_bogo) { Product.new("B001", "Green Tea", 5.00, "bogo_promo") }
  let(:product_bulk) { Product.new("S001", "Strawberries", 6.00, "bulk_promo") }
  let(:product_three) { Product.new("C001", "Coffee", 3.00, "three_per_two_promo") }

  describe "Buy One Get One promo" do
    it "applies BOGO correctly when buys 2 products" do
      result = Promo.bogo_promo(product_bogo, 2)
      expect(result[:total]).to eq(5.00)
    end

    it "Applies BOGO correctly when buys 3 products" do
      result = Promo.bogo_promo(product_bogo, 3)
      expect(result[:total]).to eq(10.00)
    end
  end

  describe "Bulk Promo" do
    it "applies bulk promo when buys 3 or more products" do
      result = Promo.bulk_promo(product_bulk, 3)
      expect(result[:total]).to eq(13.50)
    end

    it "no applies promotion when buys less than 3 products" do
      result = Promo.bulk_promo(product_bulk, 2)
      expect(result[:total]).to eq(12.00)
    end
  end

  describe ".three_per_two_promo" do
    it "applies 3x2 promo correctly when buys more than 3 products" do
      result = Promo.three_per_two_promo(product_three, 3)
      expect(result[:total]).to eq(6.00)
    end

    it "applies 3x2 promo correctly when buys 5 products" do
      result = Promo.three_per_two_promo(product_three, 5)
      expect(result[:total]).to eq(12.00)
    end
  end
end
