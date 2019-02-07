class Tester


=begin	states = {
		1 => "PA" , 
		"New York" => "NY" , 
		:Oregon => "OR" , 
	}

	puts states[:Oregon]
=end

=beginisMale = false     
isTall = false

if isMale and isTall
	puts "You are a tall male"
elsif isMale and !isTall
	puts "You are a short male"
elsif !isMale and isTall
	puts "You are not male but tall"
else 
	puts "You are not male and not tall"
end 
=end




end