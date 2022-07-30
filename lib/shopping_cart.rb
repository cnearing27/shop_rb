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

  def to_s
    @list.tally.map do |product, amount|
      "#{product.info} x #{amount} шт. = #{product.price * amount} руб."
    end
  end
end
