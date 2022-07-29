CATEGORIES = ["books", "films", "disks"]

class ProductCollection
  def initialize(products = [])
    @products = products
  end

  def self.from_dir(current_path)
    products = []

    CATEGORIES.each do |category|
      Dir["#{current_path}/data/#{category}/*.txt"].each do |file_path|
        case category
          when "books"
            products << Book.from_file(file_path)
          when "films"
            products << Film.from_file(file_path)
          when "disks"
            products << Disk.from_file(file_path)
          end
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def to_s
    output = ""

    @products.each.with_index(1) do |product, index|
      output += "#{index}. #{product.to_s}\n"
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
