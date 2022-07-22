# это ненужный файл

require_relative "./lib/product.rb"
require_relative "./lib/film.rb"
require_relative "./lib/book.rb"

params = {price: 250, amount: 4}

a = Book.new(params)
