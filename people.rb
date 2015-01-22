


class Person 
	def initialize(name)
		@name = name
	end
	def to_s
		"Hi my name is #{@name}"
	end
end

class Students < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby in an Object"
	end
end

student = Students.new("Chris")
puts student.to_s
