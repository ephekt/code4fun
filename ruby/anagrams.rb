require 'pp'

words = ['care','car', 'thread', 'race','reac','rack','mom','moo','elvis','lives','evils', 'A gentleman', 'Elegant man', 'dearth', 'hatred', 'emoter' ,'meteor' ,'remote' ,'esprits' ,'persist' ,'spriest' ,'sprites' ,'stripes' ,'sinew' ,'swine' ,'wines' ,'wisens' ]

def anagrams words = nil
	return unless words

	result = {}

	words.each do |word|
		key = word.chars.sort.join
		result[key] && result[key] << word || result[key] = [word]
	end

	result
end

pp anagrams(words)

def anagrams_with_count words = nil
	return unless words

	result = {}

	words.each do |word|
		key = word.chars.sort.join
		if result[key]
			result[key]["words"] << word
			result[key]["count"] +=1 
		else
			result[key] = {
				"words" => [word], 
				"count" => 1
			}
		end
	end

	result
end

pp anagrams_with_count(words)