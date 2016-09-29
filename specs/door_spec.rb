#door_test.rb

require 'simplecov'
require_relative 'spec_helper.rb'
require_relative '../door'

describe 'Testing Door' do

	# before :each do 
	# 	door = Door.new
	# end

	it 'Must not allow a door inscription to be written over' do
		@inscription = "Some Wise Saying"
		expect( proc { Door.new.set_inscription } ).must_raise ArgumentError 
	end

#open door tests

# 	it 'Must only open doors when those doors are closed' do
# 	end

# 	it 'Must only open doors when those doors are unlocked' do
# 	end

# 	it 'Must only open doors when those doors are closed and unlocked' do
# 	end

# 	it 'Must raise an ArgumentError if someone tries to open a locked door' do
# 	end

# 	it 'Must raise an ArgumentError if someone tries to open an open door' do
# 	end
# #lock door test

# 	it 'Must only lock doors when those doors are closed' do
# 	end

# 	it 'Must raise an ArgumentError if someone tries to lock an open door' do
# 	end

# 	it 'Must raise an ArgumentError if someone tries to lock a locked door' do
# 	end

# #close door tests

# 	it 'Must only close doors when those doors are open' do
# 	end

# #unlock door tests

# 	it 'Must only unlock doors when those doors are closed' do
# 	end

# 	it 'Must only unlock doors when those doors are locked' do
# 	end

# 	it 'Must only unlock doors when those doors are closed and locked' do
# 	end

# #verify tests

# 	it 'Must show that a locked door is closed and locked' do
# 	end



end