class Book < Product
  attr_writer :price, :amount, :name, :genre, :author
  attr_accessor :price, :amount, :name, :author, :genre

  def initialize(params, info)
    super

    @name = info[:name]
    @genre = info[:genre]
    @author = info[:author]
  end

  def to_s
    "Книга «#{@name}», #{@genre}, автор — #{@author}, #{@price} руб. (осталось #{@amount})"
  end

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)

    self.new({price: content[3], amount: content[4]},
      {name: content[0], genre: content[1], author: content[2]})
  end
end
