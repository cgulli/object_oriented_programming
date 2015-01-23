class Rover
	attr_accessor :x, :y, :direction

	def initialize(x =0, y =0, direction = "N")
		@x = x
		@y = y
		@direction = direction
	end
	
	def to_s
		"#{@x}, #{@y}) #{@direction}"
	end

	def set_launch_position(location)
		position = location.split("")
		@x = position[0].to_i
        @y = position[1].to_i
        @direction = position[2]
    end

    def read_instructions(instructions)
    	instructions.split("").each do |x|
    		if x == "M"
    			move
    		elsif x == "L" || x == "R"
    			turn(x)
    		end
    	end
    end

	def turn(t)
		if t == "L"
			if @direction == "N"
				@direction = "W"
			elsif @direction == "W"
				@direction = "S"
			elsif @direction == "E"
				@direction = "N"
			elsif @direction == "S"
				@direction = "E"
			else
				raise "Bad direction"
			end
		elsif t == "R"
			if @direction == "N"
				@direction = "E"
			elsif @direction == "W"
				@direction = "N"
			elsif @direction == "E"
				@direction = "S"
			elsif @direction == "S"
				@direction = "W"
			else
				raise "Bad direction"

			end
		end
	end 

	def move
		if @direction == "N"
			@y += 1
		elsif @direction == "W"
			@x -= 1
		elsif @direction == "E"
			@x += 1
		elsif @direction == "S"
			@y -= 1
		end
	end
	def robot_position
		puts "I am at (#{@x}, #{@y}) facing #{@direction}...on mars!!" 
	end
end

crawler =Rover.new
argo =Rover.new

puts "Input plateau size in the desired format of XY"

plateau = gets.chomp

puts "Input location of CRAWLER in the desired format of 'XYD'"

crawler_location = gets.chomp

puts "Input instructions for CRAWLER"

crawler_commands = gets.chomp

crawler.set_launch_position(crawler_location)
crawler.read_instructions(crawler_commands)

puts crawler.robot_position

puts "Input location of ARGO in the desired format of 'XYD'"

argo_location = gets.chomp

puts "Input instructions for ARGO"

argo_commands = gets.chomp

argo.set_launch_position(argo_location)
argo.read_instructions(argo_commands)

puts argo.robot_position
