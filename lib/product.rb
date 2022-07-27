class Product
  def initialize(params, info)
    @price = params[:price].to_i
    @amount = params[:amount].to_i
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
