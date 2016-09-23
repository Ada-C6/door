require_relative 'door'
first_door = Door.new("Once you enter, you cannot turn back.")

puts "You've encountered a door."
puts first_door.read_door # essentially same as first_door.inscription

puts first_door.locked? #true
puts first_door.closed?
puts first_door.gain_access
puts first_door.open_sesame #should not open
puts first_door.unlock #unlocks door, @locked_door = false
#puts first_door.unlock #should raise error
puts first_door.locked?
puts first_door.open_sesame
puts first_door.gain_access
puts first_door.lock
# puts first_door.lock #raises error
# puts first_door.unlock

#door is currently locked and closed
#need a way to open door
# puts first_door.gain_access #raises error
puts first_door.closed?


#Comments
# 1) come accross a locked and closed door
# -read door inscription
# 2) check if it's locked
# 3) check if it's open
# - if not open, try to open it
# 4) if locked, try to unlock it
# 5) if unlocked, try to open it
#   - should open once unlocked
# 6) if
