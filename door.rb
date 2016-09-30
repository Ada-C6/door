#door.rb

# Door Exercise

# A computer game usually has many different objects that can be seen and manipulated. One typical object is a door. Whether a player runs through a castle, attacks the forces of an evil empire, or places furniture in a room, a door often comes into play.

# A Door object can

# display an inscription
# be either open or closed, and
# be either locked or unlocked
# Here are some rules about how Doors work:

# Once the writing (inscription) on a Door is set, it cannot be changed
# You may open a Door if and only if it is unlocked and closed
# You may close a Door if and only if it is open
# You may lock a Door if and only if it is unlocked
# You may unlock a Door if and only if it is locked
# You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.
# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.

# You should write specs for this class, to achieve at least 90% test coverage (using simplecov).

class Door

	def initialize
		@inscription = ""
		@open_status = true
		@lock_status = false
	end

	def set_inscription(value)
		if @inscription == ""
			@inscription = value
		else 
			raise ArgumentError.new("The door already has an inscription.")
			# raise ArgumentError("The door already has an inscription.")
		end
	end

	def open_door
		if @lock_status == false && @open_status == false
			@open_status = true
		elsif 
			@open_status == true 
			raise ArgumentError.new("The door is already open.")
		elsif 
			@lock_status == true
			raise ArgumentError.new("The door is locked and cannot be opened.")
		end
	end

	def close_door
		if @open_status == true
			@open_status = false
		else
			raise ArgumentError.new("The door is already closed.")
		end
	end

	def lock_door
		if @open_status == false && @lock_status == false
			@lock_status = true
		elsif 
			@lock_status == true
			raise ArgumentError.new("The door is already locked.")
		elsif
			@open_status == true
			raise ArgumentError.new("The door is open and cannot be locked.")
		end
	end
	
	def unlock_door
		if @open_status == false && @lock_status == true
			@lock_status = false
		elsif 
			@lock_status == false
			raise ArgumentError.new("The door is already unlocked.")
		end		
	end

	def show_open
		if @open_status == true
			return "The door is open."
		else
			return "The door is closed."
		end
	end

	def show_lock
		if @lock_status	== true
			return "The door is locked."
		else 
			return "The door is unlocked."
		end
	end

	def show_inscription
		if @inscription == ""
			return "The door has no inscription yet."
		else
			return "There is an inscription on the door that says '#{@inscription}.'"
		end
	end
end
