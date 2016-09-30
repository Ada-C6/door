#door_test.rb

require 'simplecov'
require_relative 'spec_helper.rb'
require_relative '../door'

describe 'Testing Door' do


	it 'Must not allow a door inscription to be written over' do
		door = Door.new
		door.set_inscription("ABC")
		expect( proc { door.set_inscription("XYZ") } ).must_raise( "The door already has an inscription." ) 
	end

#open door tests

	it 'Must only open doors when those doors are closed' do
		door1 = Door.new
		expect ( proc { door1.open_door } ).must_raise( "The door is already open.")
	end

	it 'Must only open doors when those doors are unlocked' do
		# door.close_door
		door2=Door.new
		door2.close_door
		door2.lock_door
		expect ( proc { door2.open_door }).must_raise( "The door is locked and cannot be opened.")
	end


	it 'Must raise an ArgumentError if someone tries to open a locked door' do
		door3 = Door.new
		door3.close_door
		door3.lock_door
		expect ( proc { door3.open_door } ).must_raise( "The door is locked and cannot be opened.")
	end



#lock door test

	it 'Must raise an ArgumentError if someone tries to lock an open door' do
		door4 = Door.new
		expect ( proc { door4.lock_door }	).must_raise( "The door is open and cannot be locked." )
	end



	it 'Must raise an ArgumentError if someone tries to lock a locked door' do
		door5 = Door.new
		door5.close_door
		door5.lock_door
		expect ( proc { door5.lock_door } ).must_raise( "The door is already locked." )
	end

#close door tests

	it 'Must only close doors when those doors are open' do
		door6 = Door.new
		door6.close_door
		expect ( proc {door6.close_door } ).must_raise( "The door is already closed." )
	end

#unlock door tests

	it 'Must only unlock doors when those doors are locked' do
		door7 = Door.new
		expect ( proc { door7.unlock_door } ).must_raise( "The door is already unlocked." )
	end



#verify tests

	it 'Must show that an door is open' do
		door8 = Door.new
		expect ( door8.show_open ).must_equal( "The door is open." )
	end

	it 'Must show that a closed door is closed' do
		door9 = Door.new
		door9.close_door
		expect ( door9.show_open ).must_equal( "The door is closed." )
	end

	it 'Must show that a unlocked door is unlocked' do
		door10 = Door.new
		expect ( door10.show_lock ).must_equal( "The door is unlocked." )
	end

	it 'Must show that a locked door is locked' do
		door11 = Door.new
		door11.close_door
		door11.lock_door
		expect ( door11.show_lock ).must_equal( "The door is locked." )
	end

	it 'Must say a blank inscription is blank' do
		door12 = Door.new
		expect ( door12.show_inscription ).must_equal( "The door has no inscription yet." )
	end

	it 'Must show inscription' do
		door13 = Door.new
		door13.set_inscription("Hi Jamie")
		expect ( door13.show_inscription ).must_equal( "There is an inscription on the door that says 'Hi Jamie.'" )
	end

end