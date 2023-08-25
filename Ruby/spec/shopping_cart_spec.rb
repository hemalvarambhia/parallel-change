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

  it "has discount when the shopping card contains exactly one premium item over 100 currency units" do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(100)

    expect(shopping_cart.has_discount?).to be true
  end

  it "has discount when the shopping cart contains only premium item over 100 currency units" do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(101)
    shopping_cart.add(100)

    expect(shopping_cart.has_discount?).to be true
  end

  it "has discount when the shopping cart contains at least one premium item over 100 currency units" do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(10)
    shopping_cart.add(100)

    expect(shopping_cart.has_discount?).to be true
  end

  it "does not have discount when the cart contains exactly one cheap (< 100) item of shopping" do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(10)

    expect(shopping_cart.has_discount?).to be false
  end

  it "does not have discount when the cart contains multiple cheap (< 100) items of shopping" do
    shopping_cart = ShoppingCart.new

    shopping_cart.add(10)
    shopping_cart.add(99)

    expect(shopping_cart.has_discount?).to be false
  end
end
