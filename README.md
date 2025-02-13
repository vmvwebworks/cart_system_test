# cart_system_test

Hello, following the instructions added to the mail this is the code challenge i did.

The easy way for check how it works it's launching tests with Rspec, i suggest to use a gemset with **RVM** for install the gem (also pry added for debugging).

The other way is with **irb** on console and initialize variables, for example in this way and order:
```ruby
load 'bootup.rb'
# use bogo_promo, bulk_promo, three_per_two_promo samples
sample1 = Product.new("sample1", "sample product 1", 5.0, "bogo_promo")
sample2 = Product.new("sample2", "sample product 2", 5.0, "bulk_promo")
cart = Cart.new
# feel free to add sample products
cart.scan(sample1)
cart.scan(sample2)
cart.scan(sample1)
cart.scan(sample2)
cart.scan(sample1)
cart.scan(sample2)

cart.check_out
```
The output will show something like seen in tests outputs, that was written with the examples of the task:
```bash
Product code: GR1, Name: Green Tea, Price per unity: 3.11, Promo: bogo_promo
Product code: CF1, Name: Coffee, Price per unity: 11.23, Promo: three_per_two_promo
Product code: SR1, Name: Strawberries, Price per unity: 5.0, Promo: bulk_promo
Product code: CF1, Name: Coffee, Price per unity: 11.23, Promo: three_per_two_promo
Product code: CF1, Name: Coffee, Price per unity: 11.23, Promo: three_per_two_promo
---
Totals
---
Product code: GR1, Promo: , Quantity: 1, total: 3.11
Product code: CF1, Promo: three_per_two_promo, Quantity: 3, total: 22.46
Product code: SR1, Promo: , Quantity: 1, total: 5.0
Total: 30.57

```



