require_relative "product.rb"

class Book < Product
  attr_writer :price, :amount, :name, :genre, :author

  def initialize(params, info)
    super

    @name = info[:name]
    @genre = info[:genre]
    @author = info[:author]
  end

  def to_s
    "Книга «#{@name}», #{@genre}, автор — #{@author}, #{@price} руб. (осталось #{@amount})"
  end
end
