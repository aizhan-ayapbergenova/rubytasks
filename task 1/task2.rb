#Площадь треугольника. Площадь треугольника можно вычилсить, зная его основание (a) и высоту (h) по формуле: 1/2*a*h. 
#Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.

puts "Enter height"
height = gets.chomp.to_f

puts "Enter base"
base = gets.chomp.to_f

area = height*base*0.5
puts "The area is equal to #{area}."
