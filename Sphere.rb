class Sphere
	def initialize(radius)
	@r = radius
	end 
end 

class Sphere 
	def area
		(@r ** 2) * 4.0 * Math::PI
	end 

	def volume 
		area * (@r/3)
	end
end

class Ball < Sphere
	def initialize(radius, color)
		super(radius)
		@color = color
	end

	def to_s
		"Ball: #@r, #@color"
	end
end

class MyBall < Ball
	def initialize(radius, color, owner)
		super(radius, color)
		@owner = owner
	end 

	def to_s
		"My" +super + ", #@owner"
	end 
end

b = Ball.new(1, "red")
puts ; p b; puts
puts "Area = " + b.area.to_s
puts "Volume =  " + b.volume.to_s
puts ; puts b.to_s ; puts 