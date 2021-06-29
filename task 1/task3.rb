=begin
Прямоугольный треугольник. Программа запрашивает у пользователя 3 стороны треугольника 
и определяет, является ли треугольник прямоугольным, используя теорему Пифагора (www-formula.ru)
и выводит результат на экран. Также, если треугольник является при этом равнобедренным
(т.е. у него равны любые 2 стороны), то дополнительно выводится информация о том,
что треугольник еще и равнобедренный. Подсказка: чтобы воспользоваться теоремой Пифагора, 
нужно сначала найти самую длинную сторону (гипотенуза) и сравнить ее значение в квадрате
с суммой квадратов двух остальных сторон. Если все 3 стороны равны, то треугольник равнобедренный 
и равносторонний, но не прямоугольный.
=end

side=[]
 
puts 'Enter side 1:'
side << gets.chomp.to_f

puts 'Enter side 2:'
side << gets.chomp.to_f

puts 'Enter side 3:'
side << gets.chomp.to_f

side.sort!

if side[2]**2 == side[0]**2 + side[1]**2
  puts "This is a right triangle"
elsif side[2]**2 == side[0]**2 + side[1]**2 && side[0] == side[1]
  puts "This is a right and isosceles triagle"
elsif side[2] == side[1] && side[2] == side[0]
  puts "This is an equilateral and isosceles triangle"
else 
  puts "This is not a right triangle"    
end
