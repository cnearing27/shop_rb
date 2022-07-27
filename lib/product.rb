class Product
  def initialize(params, info)
    @price = params[:price]
    @amount = params[:amount]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
