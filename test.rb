class MakingArray

	def self.makeArray(size)
		Array.new(size) {rand(10)}
	end

	def self.sorted? (a)
		0.upto a.length-2 do |i|
			if a[i] > a[i+1] then
				print "Array is not sorted \n\n"
				return
			end 
		end
		print "Array is sorted \n\n"
	end

	def self.show(a)
		a.length.times do |i|
			print ' ', a[i]
			puts if  (i+1)%20 == 0
		end 
		puts
	end 

a = makeArray(200); show(a); sorted?(a)
a.sort!; show(a); sorted?(a)

end

