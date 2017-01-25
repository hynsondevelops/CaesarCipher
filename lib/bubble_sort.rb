def bubble_sort(array)
	swapOccured = true;
	for i in 0...array.size
		if (swapOccured)
			swapOccured = false;
			for j in 0...(array.size - 1)
				if (array[j] > array[j + 1])
					temp = array[j]
					array[j] = array[j + 1]
					array[j + 1] = temp
					swapOccured = true
				end
			end
		end
	end
	puts array
	return array
end

def bubble_sort_by(array)
	swapOccured = true;
	for i in 0...array.size
		if (swapOccured)
			swapOccured = false;
			for j in 0...(array.size - 1)
				comparison = yield(array[j], array[j + 1])
				if (comparison > 0)
					temp = array[j]
					array[j] = array[j + 1]
					array[j + 1] = temp
					swapOccured = true
				end
			end
		end
	end
	puts array
	return array
end

bubble_sort([4,3,78,2,0,2])

bubble_sort([0, 2, 3, 5, 4])

bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end

