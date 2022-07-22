require_relative "product.rb"

class Film < Product
  def initialize(params, info)
    super

    @name = info[:name]
    @year = info[:year]
    @author = info[:author]
  end

  def to_s
    "Фильм «#{@name}», #{@year}, реж. #{@author}, #{@price} руб. (осталось #{@amount})"
  end
end
