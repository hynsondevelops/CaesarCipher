def substrings(string, dictionary)
	stringArray = string.split(" ")
	substringHash = Hash.new(0)
	for j in 0...stringArray.size
		string = stringArray[j]
		string = string.downcase
		for i in 0...dictionary.size
			if (string.include?(dictionary[i]))
				substringHash[dictionary[i]] += 1
			end
		end
	end
	puts substringHash
	return substringHash
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)


