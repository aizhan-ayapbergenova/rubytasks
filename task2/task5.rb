=begin
Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может 
быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде 
Date#yday или Date#leap?) Алгоритм опредления високосного года: www.adm.yar.ru
=end

puts "Enter your day:"
day   = gets.to_i

puts "Enter your month:"
month = gets.to_i

puts "Enter your year:"
year  = gets.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if year % 4 == 0 || year % 400 == 0 || year % 100 != 0
  months[1] = 29
  puts "This is a leap year"
end

if month == 1 
  result = day
else
  date = months[0..(month-2)].inject(:+) + day
end

puts "The ordinal number of your date: #{date}"
