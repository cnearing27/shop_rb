class Disk < Product
  attr_accessor :price, :amount, :name, :year, :genre, :author

  def initialize(params)
    super

    @name = params[:name]
    @year = params[:year]
    @author = params[:author]
    @genre = params[:genre]
  end

  def info
    "Альбом «#{@name}», #{@genre}, #{@year}, исполнитель: #{@author}"
  end

  def self.from_file(file_path)
    content = File.readlines(file_path, chomp: true)

    new({price: content[4], amount: content[5],
      name: content[0], year: content[3], author: content[1], genre: content[2]})
  end
end
