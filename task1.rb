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
