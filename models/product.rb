class Product
    attr_accessor :product_code, :name, :price, :promo_code

    def initialize(product_code, name, price, promo_code=nil)
        raise ArgumentError, "Price must be a number" unless price.is_a?(Float)
        
        @product_code = product_code
        @name = name
        @price = price
        @promo_code = promo_code
    end

rescue ArgumentError => e
    puts "Error: #{e.message}"
end