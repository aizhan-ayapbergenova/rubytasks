array=(10..100).to_a.delete_if {|a| a%5 !=0}
puts array
