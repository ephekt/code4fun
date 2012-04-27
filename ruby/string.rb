# reverse words in a string

def reverse_words(string)
	string.split(" ").map do |word,index|
		s = ""
		word.each_char { |c| s.insert(0,c) }
		s	
	end.join(" ")
end

def reverse_words2(string)
	string.split(" ").map { |w| w.reverse }.join(" ")
end

def reverse_string(s)
	(0...(s.length/2)).each do |index| 
		s[index], s[s.length-index-1] = s[s.length-index-1], s[index]
	end
	s
end

start_string = "this is my plate"

puts "Reverse words 1 : " + reverse_words(start_string)
puts "Reverse words 2 : " + reverse_words2(start_string)
puts "Reverse string : " + reverse_string(start_string) 
