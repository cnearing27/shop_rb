class Film < Product
  attr_accessor :price, :amount, :name, :author, :year

  def initialize(params)
    super

    @name = params[:name]
    @year = params[:year]
    @author = params[:author]
  end

  def info
    "Фильм «#{@name}», #{@year}, реж. #{@author}"
  end

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)

    self.new({price: content[3], amount: content[4],
      name: content[0], year: content[1], author: content[2]})
  end
end
