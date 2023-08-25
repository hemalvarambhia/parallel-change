class ShoppingCart
  def initialize
    #
    # the goal is to remove this field, replacing with
    @prices = []
    @price = 0
  end

  def add(price)
    @price = price
    @prices << price
  end

  def number_of_products
    @prices.count
  end

  def calculate_total_price
    @prices.sum(0)
  end

  def has_discount?
    @prices.any? { |price| price >= 100 }
  end
end

class SomeConsumer
  def do_stuff
    shopping_cart = ShoppingCart.new
    shopping_cart.add(100)
    puts "other consumer: #{shopping_cart.calculate_total_price}"
  end
end

if __FILE__ == $PROGRAM_NAME
  shopping_cart = ShoppingCart.new
  shopping_cart.add(10)
  puts "number of products: #{shopping_cart.number_of_products}"
  puts "total price: #{shopping_cart.calculate_total_price}"
  puts "has discount: #{shopping_cart.has_discount?}"
end
