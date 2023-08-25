require_relative "../lib/shopping_cart"

describe "ShoppingCart" do
  it "may just have a single item" do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(10)

    expect(shopping_cart.number_of_products).to eq(1)
  end

  it "has the total price equal to total price of its contents" do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(10)

    expect(shopping_cart.calculate_total_price).to eq(10)
  end

  it 'contains multiple shopping items' do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(19)
    shopping_cart.add(80)
    shopping_cart.add(100)

    expect(shopping_cart.number_of_products).to eq(3)
    expect(shopping_cart.calculate_total_price).to eq(199)
  end

  describe 'qualifying for discounts' do
    example "shopping cart containing exactly one premium item over 100 currency units qualifies for a discount" do
      shopping_cart = ShoppingCart.new

      shopping_cart.add(100)

      expect(shopping_cart.has_discount?).to be true
    end

    example "shopping cart containing only premium items over 100 currency units qualifies for a discount" do
      shopping_cart = ShoppingCart.new

      shopping_cart.add(101)
      shopping_cart.add(100)

      expect(shopping_cart.has_discount?).to be true
    end

    example "shopping cart containing at least one premium item over 100 currency units qualifies for a discount" do
      shopping_cart = ShoppingCart.new

      shopping_cart.add(10)
      shopping_cart.add(100)

      expect(shopping_cart.has_discount?).to be true
    end

    example "shopping cart containing exactly one cheap (< 100) item of shopping does not qualify for a discount" do
      shopping_cart = ShoppingCart.new

      shopping_cart.add(10)

      expect(shopping_cart.has_discount?).to be false
    end

    it "shopping cart containing only cheap (< 100) items of shopping does not qualify for a discount" do
      shopping_cart = ShoppingCart.new

      shopping_cart.add(10)
      shopping_cart.add(99)

      expect(shopping_cart.has_discount?).to be false
    end
  end

end
