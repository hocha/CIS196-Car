class Car
	@@count = 0
	attr_accessor :model,  :seats, :color, :cost, :paid

	def initialize(model, seats, color, cost, paid)
		@model = model
		@seats = seats
		@color = color
		@cost = cost
		@paid = paid
		@@count += 1
	end
	def self.get_count
		return @@count
	end

	def self.get_model
		return @model
	end

	def self.get_seats
		return @seats
	end

	def self.get_color
		return @color
	end

	def self.get_cost
		return @cost
	end

	def print
		p "model: #{@model}"
		p "seats: #{@seats}"
		p "color: #{@color}"
		p "cost: #{@cost}"
		p "paid: #{@paid}"
	end
end


def addcar (garage)
	puts "what's the model: "
	model = gets.chomp
	puts "how many seats are there: "
	seats = gets.chomp.to_i
	puts "what color is it: "
	color = gets.chomp
	puts "how much is it: "
	cost = gets.chomp.to_i
	puts "paid for already (1) or no (2)?"
	status = gets.chomp.to_i
	status = if status == 1
				true
			elsif status == 2
				false
			else 
				false
			end

	car = Car.new(model, seats, color, cost, status)
	garage.push(car)
end

def sort_cars (garage)
	garage.sort{|a, b| b.name <=> a.name}
end

garage = []

leave = false


while (!leave) 
	puts "(1) add a car"
	puts "(2) show a car"
	puts "(3) take a car for a drive"
	puts "(4) finish paying"
	puts "(5) sort"
	puts "(6) leave"

	option = gets.chomp.to_i rescue 6
	
	if (option == 1)
		garage = addcar(garage)
	elsif (option == 2)
		puts "which car? (between 0 and #{garage.length}"
		selected = gets.chomp.to_i
		garage[selected].print rescue puts "that's not very nice"
	elsif (option == 3)
		puts "which car? (between 0 and #{garage.length}"
		selected = gets.chomp.to_i
		garage.pop(selected) rescue puts "booo you"
	elsif (option == 4)
		puts "which car? (between 0 and #{garage.length}"
		selected = gets.chomp.to_i
		garage[selected].paid = true
		#garage[selected].print
	elsif (option == 5)
		garage = sort_cars(garage)
	else
		leave = true
		puts "thanks for stopping by!"
	end

end


