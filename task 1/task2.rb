#Площадь треугольника. Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h. 
#Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.

puts 'Enter base'
a = gets.chomp.to_f

puts 'Enter height'
h = gets.chomp.to_f

area = a * h * 0.5

puts "The triangular area is #{area}"
