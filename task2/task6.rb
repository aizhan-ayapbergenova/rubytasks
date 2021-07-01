=begin
Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу
и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести 
произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия 
товара. На основе введенных данных требуетеся:
Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
а значением - вложенный хеш, содержащий цену за единицу товара и кол-во 
купленного товара. Также вывести итоговую сумму за каждый товар.
Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
=end

goods = {}
goods_total = {}
loop do
  puts "Enter the name of the goods or simply enter 'stop'."
  name = gets.chomp.to_sym

  break if name == "stop".to_sym
    
  puts "How much does it cost?"
  cost = gets.chomp.to_f

  puts "How many items are you purchasing?"
  quantity = gets.chomp.to_f

  goods[name] = {item_cost: cost, item_quantity: quantity}
end

total = 0

goods.each do |name, info|
    goods_total[name] = info[:item_cost] * info[:item_quantity]
    total = goods_total.values.reduce(:+) 
end

puts "Item and its price:" 
goods_total.each{|good, costs| puts "#{good}: #{costs}"}
puts "the total cost of the goods: #{total}"
