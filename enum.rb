module Enumerable
	
	def my_each
		for data in self
			yield(data)
		end
	end

	def my_each_with_index
		for i in 0...self.size
			yield(self[i], i)
		end
	end

	def my_select
		newArray = Array.new
		self.my_each do |data|
			if (yield(data))
				newArray.push(data)
			end
		end
		print newArray
		print "\n"
		return newArray
	end

	#add implicit
	def my_all?
		if block_given?
			self.my_each do |data|
				if (!yield(data))
					return false
				end
			end
			return true;
		else
			self.my_all? {|data| data}
		end
	end

	#add implicit
	def my_any?
		if block_given?
			self.my_each do |data|
				if (yield(data))
					return true;
				end
			end
			return false
		else 
			self.my_any? {|data| data}
		end
	end

	#add implicit
	def my_none?
		if block_given?
			self.my_each do |data|
				if (yield(data))
					return false
				end
			end
			return true;
		else
			self.my_none? {|data| data}
		end
	end

	def my_count(item = nil)
		if block_given? #count how the block dictates
			count = 0; 
			self.my_each do |data|
				if (yield(data))
					count += 1;
				end
			end
			return count;
		else 
			if (item != nil) #item given to be counted
				count = 0;
				self.my_each do |data|
					if (data == item)
						count += 1;
					end
				end
				return count;
			else #size of object
				return self.size
			end
		end
	end

	def my_map
		if block_given? #return an array
			newArray = Array.new
			self.my_each do |data|
				newArray.push(yield(data))
			end
			return newArray;
		else #return an enumerator
			return self;
		end
	end


	def my_inject(sum = 0)
		if block_given?
			self.my_each do |data|
				sum = yield(sum, data)
			end
		else
			puts "no block"
		end
		return sum;

	end

end


array = Array.new
otherArray = Array.new
array = [0, 2, 1]
otherArray = [0, 2, 4]

puts "\n"
puts "my_each\n"
puts "\n"
array.my_each do |element|
	puts element
end

puts "\n"
puts "my_each_with_index\n"
puts "\n"
array.my_each_with_index do |element, index|
	print "Element: #{element}, Index: #{index}\n"
end

puts "\n"
puts "my_select\n"
puts "\n"
array.my_select {|element| element.even?}

puts "\n"
puts "my_all?\n"
puts "\n"
puts array.my_all? {|element| element.even?}

puts otherArray.my_all? {|element| element.even?}

puts array.my_all? {|element| element.even?}

puts otherArray.my_all? {|element| element.even?}

puts [true, false].my_all?

puts [true, true].my_all?

puts "\n"
puts "my_any?\n"
puts "\n"
puts array.my_any? {|element| element.even?}

puts otherArray.my_any? {|element| element.odd?}

puts "True, False"
puts [true, false].my_any?

puts [false, false].my_any?

puts "\n"
puts "my_none?\n"
puts "\n"
puts array.my_none? {|element| element.even?}

puts otherArray.my_none? {|element| element.odd?}

puts "False, True" 
puts [true, false].my_none?

puts [false, false].my_none?

puts "\n"
puts "my_count"
puts "\n"
puts array.my_count
puts array.my_count(2)
puts array.my_count {|element| element.even?}

puts "\n"
puts "my_map"

print array.my_map {|element| element * element}
puts "\n"

print array.my_map
puts "\n"


puts "\n"
print "my_inject"
puts "\n"

puts (5..10).my_inject {|sum, n| sum + n}
puts (5..10).my_inject(1) { |product, n| product * n }