def stock_picker(stocks)
	bestIndexes = Array.new(2);
	bestPair = 0;
	currentPair = 0;
	i = 0;
	j = 0;
	for i in 0...stocks.size
		for j in i...stocks.size
			puts stocks[j];
			currentPair = stocks[j] - stocks[i];
			if (currentPair > bestPair)
				bestPair = currentPair;
				bestIndexes[0] = i;
				bestIndexes[1] = j;
			end
		end
	end
	return bestIndexes;
end

def stock_picker_tests()
	puts "\nStock Picker Unit Tests\n"
	correctCounter = 0;
	incorrectCounter = 0;
	#tests
	test1 = stock_picker([17,3,6,9,15,8,6,1,10])
	
	#test 1
	puts "\nTest 1"
	if (test1 == [1, 4])
		puts "Correct!"
		correctCounter += 1;
	else
		puts "Incorrect"
		incorrectCounter += 1;
	end
	puts "Expected: [1, 4]"
	puts "Output: #{test1}"


	#Results
	puts "\n\nTest Results"
	puts "Tests Passed #{correctCounter}"
	puts "Tests Failed: #{incorrectCounter}"
	if (incorrectCounter == 0)
		puts "Passed all unit tests!"
	end
end

stock_picker_tests