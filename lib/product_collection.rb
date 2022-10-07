require_relative "product"
require_relative "film"
require_relative "book"
require_relative "disk"

CATEGORIES = { books: Book, films: Film, disks: Disk }

class ProductCollection
  def initialize(products = [])
    @products = products
  end

  def self.from_dir(current_path)
    products = []

    CATEGORIES.each do |category, product|
      Dir["#{current_path}/data/#{category}/*.txt"].each do |file_path|
        products << product.from_file(file_path)
      end
    end

    new(products)
  end

  def to_a
    @products
  end

  def to_s
    output = ""

    @products.each.with_index(1) do |product, index|
      output += "#{index}. #{product.to_s}, \n"
    end
    output += "\n0. Выход\n\n"

    output
  end

  def sort!(params)
    case params[:key]
      when :price
        @products.sort_by! { |product| product.price }
      when :amount
        @products.sort_by! { |product| product.amount }
      when :name
        @products.sort_by! { |product| product.name }
    end

    @products.reverse! if params[:order] == "desc"
  end
end
