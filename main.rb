require_relative "./lib/Door"
require_relative "./lib/Interface"

ui = Interface.new
begin
  door = Door.new
rescue Door::IsOpenAndLockedError
  puts "The door can not be initialized with both open and locked."
rescue Door::InscriptionIsNotString
  puts "The inscription can not be initialized with a non-string except nil."
rescue Door::IsOpenIsNotBoolean
  puts "The door's open or close status can not be initialized with a non-boolean."
rescue Door::IsLockedIsNotBoolean
  puts "The door's lock or unlocked status can not be initialized with a non-boolean."
end
ui.play(door)
