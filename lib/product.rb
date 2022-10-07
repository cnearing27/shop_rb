class Product
  def initialize(params)
    @price = params[:price].to_i
    @amount = params[:amount].to_i
  end


  def info
    raise NotImplementedError
  end

  def to_s
    "#{info}, #{@price} руб. (осталось #{@amount})"
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
