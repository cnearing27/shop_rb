require_relative "./lib/product.rb"
require_relative "./lib/film.rb"
require_relative "./lib/book.rb"

films = []
books = []

films << Film.new({price: 990, amount: 5},
  {name: "Леон", year: 1994, author: "Люк Бессон"})

films << Film.new({price: 390, amount: 1},
  {name: "Дурак", year: 2014, author: "Юрий Быков"})

books << Book.new({price: 1500, amount: 10},
  {name: "Идиот", genre: "роман", author: "Федор Достоевский"})

films << Film.from_file("./data/films/0001.txt")
books << Book.from_file("./data/books/0001.txt")

films[1].year = 1000

puts "Вот какие товары у нас есть:"
puts

films.each do |film|
  puts film
end

books.each do |book|
  puts book
end
