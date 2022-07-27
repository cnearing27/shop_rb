require_relative "./lib/product.rb"
require_relative "./lib/film.rb"
require_relative "./lib/book.rb"
require_relative "./lib/disk.rb"
require_relative "./lib/product_collection.rb"


collection = ProductCollection.from_dir(__dir__)
collection.sort!(key: :price, order: "asc")

arr_collection = collection.to_a

shopping_list = []
user_input = nil
sum = 0

loop do
  puts
  puts "Что хотите купить?"

  arr_collection.each.with_index(1) do |product, index|
    puts "#{index}. #{product}"
  end

  puts
  puts "0. Выход"
  puts

  user_input = -1

  until (0..arr_collection.size).include?(user_input)
    print "> "
    user_input = gets.to_i
  end

  break if user_input == 0

  if arr_collection[user_input - 1].amount > 0
    puts
    puts "Вы выбрали: #{arr_collection[user_input - 1]}"

    arr_collection[user_input - 1].amount -= 1
    sum += arr_collection[user_input - 1].price

    puts
    puts "Всего товаров на сумму: #{sum} руб."

    shopping_list << arr_collection[user_input - 1]
  else
    puts
    puts "Данный товар закончился :("
  end
end

puts

if sum == 0
  puts "Вы ничего не купили :( Возвращайтесь в другой раз!"
else
  puts "Вы купили:"
  puts
  puts shopping_list.to_a
  puts
  puts "С Вас — #{sum} руб. Спасибо за покупки!"
end
