class Film < Product
  attr_writer :price, :amount, :name, :year, :author
  attr_accessor :price, :amount, :name, :author, :year

  def initialize(params, info)
    super

    @name = info[:name]
    @year = info[:year]
    @author = info[:author]
  end

  def info
    "Фильм «#{@name}», #{@year}, реж. #{@author}"
  end

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)

    self.new({price: content[3], amount: content[4]},
      {name: content[0], year: content[1], author: content[2]})
  end
end
