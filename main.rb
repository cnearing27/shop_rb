require_relative "lib/shopping_cart"
require_relative "lib/product_collection"

collection = ProductCollection.from_dir(__dir__)
collection.sort!(key: :price, order: "asc")

arr_collection = collection.to_a
shopping_list = ShoppingCart.new

loop do
  puts
  puts "Что хотите купить?"

  puts collection

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
    shopping_list.add(arr_collection[user_input - 1])

    if arr_collection[user_input - 1].amount == 0
      arr_collection.delete_at(user_input - 1)
    end

    puts
    puts "Всего товаров на сумму: #{shopping_list.sum} руб."

  else
    puts
    puts "Данный товар закончился :("
  end
end

puts

if shopping_list.sum == 0
  puts "Вы ничего не купили :( Возвращайтесь в другой раз!"
else
  puts "Вы купили:"
  puts
  puts shopping_list
  puts
  puts "С Вас — #{shopping_list.sum} руб. Спасибо за покупки!"
end
