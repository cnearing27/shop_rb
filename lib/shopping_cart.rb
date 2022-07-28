class ShoppingCart
  def initialize
    @list = []
    @sum = 0
  end

  def add(product)
    @list << product
    @sum += product.price
  end

  def to_a
    @list.uniq!
  end

  def sum
    @sum
  end
end
