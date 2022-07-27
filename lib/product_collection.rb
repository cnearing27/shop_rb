class ProductCollection
  def initialize(products = [])
    @products = products
  end

  def self.from_dir(current_path)
    products = []

    Dir["#{current_path}/data/books/*.txt"].each do |file_path|
      products << Book.from_file(file_path)
    end

    Dir["#{current_path}/data/films/*.txt"].each do |file_path|
      products << Film.from_file(file_path)
    end

    Dir["#{current_path}/data/disks/*.txt"].each do |file_path|
      products << Disk.from_file(file_path)
    end

    self.new(products)
  end

  def to_a
    @products
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
