class Chef

	def make_chicken
		puts "Make Chicken"
	end

	def make_salad
		puts "Make salad"
	end

	def make_special_dish
		puts "Make ribs"
	end
end

class ItalianChef < Chef 
	def make_special_dish
		puts "Make spaghetti"
	end

	def make_pasta
		puts "Make pasta"
	end 

end 


chef = Chef.new()
chef.make_chicken
chef.make_special_dish

italian_chef = ItalianChef.new()
italian_chef.make_salad
italian_chef.make_special_dish
italian_chef.make_pasta