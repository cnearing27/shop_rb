class Book < Product
  attr_accessor :price, :amount, :name, :author, :genre

  def initialize(params)
    super

    @name = params[:name]
    @genre = params[:genre]
    @author = params[:author]
  end

  def info
    "Книга «#{@name}», #{@genre}, автор — #{@author}"
  end

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)

    self.new({price: content[3], amount: content[4],
      name: content[0], genre: content[1], author: content[2]})
  end
end
