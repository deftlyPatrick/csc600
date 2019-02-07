class Book1
	def initialize(author, title)
		 @a = author
		 @t = title
	end
end 

class Book1
	def show1
		puts @a + @t
	end
end

class Book2 < Book1
	def initialize(author, title, publisher, price)
		super(author, title)
		@publisher = publisher
		@price = price
	end

	def read2
	    puts "Who is the author?"
	    @a = gets
	    @a = @a.chomp
	    puts "What is the title?"
	    @t = gets
	    @t = @t.chomp
	    puts "Who is the publisher?"
	    @publisher = gets
	    @publisher = @publisher.chomp
	    puts "What is the price?"
	    @price = gets
	    @price = @price.chomp
	end

	def show2
		puts "Author: " + @a + " Title: "+ @t + "\nPublisher: " + @publisher + " Price: " + @price
	end 
end 

bookOne = Book2.new("Henry", "Hello World", "Newport", "50")
bookTwo = Book2.new("Albert", "Hey World", "New York", "40")
bookThree = Book2.new("Nancy", "Hi World", "Cali", "30") 