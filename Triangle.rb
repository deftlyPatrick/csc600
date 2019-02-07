
class Triangle



  def initialize(a,b,c)
    if a > b then a,b = b,a end
    if b > c then b,c = c,b end
  end

  def perimeter
    @a+@b+@b
  end

  def area
    s = 0.5 * perimeter
    Math::sqrt(s*(s-@a)*(s-@b)*(s-@c))
  end

  def valid
    @a>0 && @b>0 && @c>0 && @a+@b>@c && @a+@c>@b && @b+@c>@a

  def test
    print "It is"
    if !valid then print " not"
    end
    puts " a triangle"
    if valid
      puts "It is scalene" if (@a != @b) && (@b != @c) && (@a != @c)
      puts "It is isosceles" if (@a == @b) || (@b == @c) || (@a == @c)
      puts "It is equilateral" if (@a == @b) && (@b == @c)
      puts "It is right" if (@a*@a) + (@b*@b) == (@c*@c)
      end
  end
end

t = Triangle.new(4,5,3)
p t
puts t.valid
puts "\n The sides are [#{t.a}, #{t.b}, #{t.c}]"
t.tester

