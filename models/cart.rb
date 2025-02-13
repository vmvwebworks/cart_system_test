class Cart
    include Promo
    attr_reader :products, :promo_totals

    def initialize
        @products = []
        @promo_totals = []
    end
    
    def scan(product)
        @products << product
    end

    def list_product(product)
        puts "Product code: #{product.product_code}, Name: #{product.name}, Price per unity: #{product.price}, Promo: #{product.promo_code}"
    end

    def list_promo(promo)
        puts "Product code: #{promo[:product_code]}, Promo: #{promo[:promo_code]}, Quantity: #{promo[:quantity]}, total: #{promo[:total]}"
    end

    def check_promos(products)
        @promo_totals = []
        counted = products.group_by(&:product_code).transform_values { |prods| { product: prods.first, quantity: prods.count } }

        counted.each do | (product_code, promo_code), data |
            @promo_totals << Promo.apply(data[:product], data[:quantity])
        end
    end

    def check_out
        check_promos(@products)
        puts "---"
        @products.map {|p| list_product(p)}
        puts "---"
        puts "Totals"
        puts "---"
        @promo_totals.map {|p| list_promo(p)}
        total = @promo_totals.map {|pt| pt[:total]}.sum
        puts "Total: #{total}"
        total
    end
end