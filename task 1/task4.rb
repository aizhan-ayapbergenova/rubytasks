=begin
Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет 
дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта
и корней на экран. При этом возможны следующие варианты:
  Если D > 0, то выводим дискриминант и 2 корня
  Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
  Если D < 0, то выводим дискриминант и сообщение "Корней нет"
=end

puts 'Enter a:'
a = gets.chomp.to_f

puts 'Enter b:'
b = gets.chomp.to_f

puts 'Enter c:'
c = gets.chomp.to_f

discriminant = b**2 - 4*a*c
if discriminant == 0
  x = -b / ( 2 * a )
  puts "The Discriminant is equal to #{discriminant} and the root is #{x}"
elsif discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
  puts "The Discriminant is equal to #{discriminant} and the roots are #{x1} and #{x2}"
else
  puts "The Discriminant is equal to #{discriminant} and there are no roots"
end   
