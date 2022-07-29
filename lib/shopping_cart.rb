class ShoppingCart
  attr_reader :sum
  def initialize
    @list = []
    @sum = 0
  end

  def add(product)
    @list << product
    @sum += product.price
  end

  def to_a
    @list.uniq
  end
end
