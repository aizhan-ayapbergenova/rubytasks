#Идеальный вес. Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле <рост> - 110, 
#после чего выводит результат пользователю на экран с обращением по имени. Если идеальный вес получается отрицательным, 
#то выводится строка "Ваш вес уже оптимальный"

puts "What is your name?"
name = gets.chomp

puts "What is your height?"
height = gets.chomp.to_i

ideal_height = height-110

if ideal_height <=0
    puts "#{name}, your weight is ideal."
else
    puts "#{name}, your ideal weight is #{ideal_height} kg."
end
