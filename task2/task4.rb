#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
 
alphabet = ('A'..'Z')
vowel = %w(A E I O U )

hash_vowels = {}

alphabet.each.with_index(1) do |letter, number|
  hash_vowels[letter] = number if vowel.include?(letter)
end

puts hash_vowels
