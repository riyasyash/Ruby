class ArrayIterator  ##External array Iterator
	def initialize(array)
		@array = array
		@index = 0
	end
	def has_next?
		@index < @array.length
	end
	def item
		@array[@index]
	end
	def next_item
		value = @array[@index]
		@index +=1
		value #returning or replacig value in the calling method
	end
	
end

def for_each_element(array) ##internal iterator sample
		i = 0
		while i < array.length
			yield(array[i])
			i += 1
		end
end

def merge(array1,array2)
	sorted = []

	iterator1 = ArrayIterator.new(array1)
	iterator2 = ArrayIterator.new(array2)

	while(iterator1.has_next? and iterator2.has_next?)
		if(iterator1.item < iterator2.item)
			sorted << iterator1.next_item
		else
			sorted << iterator2.next_item
		end
	end

	while(iterator1.has_next?)
		sorted << iterator1.next_item
	end

	while(iterator2.has_next?)
		sorted << iterator2.next_item
	end
	sorted
end

array = ['apple','orange','grape']
array1 = [2,4,6,8]
array2 = [1,3,5,7,9]

puts(merge(array1,array2)) #example of merging two sorted arrays using iterartor

i= ArrayIterator.new(array)
while i.has_next?   ##External iterator loop
	puts("item: #{i.next_item}")
	
end
for_each_element(array){|element| puts("item-element: #{element}")}##internal itearator code block



