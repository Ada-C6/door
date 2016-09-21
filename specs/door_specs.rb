# A computer game usually has many different objects that can be seen and manipulated. One typical object is a door. Whether a player runs through a castle, attacks the forces of an evil empire, or places furniture in a room, a door often comes into play.
#
# A Door object can
#
# display an inscription
# be either open or closed, and
# be either locked or unlocked
# Here are some rules about how Doors work:
#
# Once the writing (inscription) on a Door is set, it cannot be changed
# You may open a Door if and only if it is unlocked and closed
# You may close a Door if and only if it is open
# You may lock a Door if and only if it is unlocked
# You may unlock a Door if and only if it is locked
# You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.
# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
#
# You should write specs for this class, to achieve at least 90% test coverage (using simplecov).

# door_specs.rb

require_relative 'spec_helper.rb'

require_relative '../lib/door.rb'

describe 'Test Door' do

  # This is an example let statement
  let(:something) { Something.something }



    it 'This is the test' do
    end


  # Test that a new door is an instance of the door class

  # Test that a new door requires an inscription and defaults to closed and locked

  # Test that a new door can be instantiated in a custom configuration

  # Test that we can access the door's open/closed status

  # Test that we can access the door's locked/unlocked status

  # Test that we can read the inscription on the door

  # Test that we cannot change the inscription of the door

  # Test that a user cannot simply override the open/closed status

  # Test that a user cannot simply override the locked/unlocked status

  # Test that we can open a door if it is unlocked and closed

  # Test that we cannot open a door if it is not unlocked and closed

  # Test that we can close a door it if is open

  # Test that we cannot close a door if it is closed

  # Test that we can lock a door if it is unlocked

  # Test that we cannot lock a door if it is locked

  # Test that we can unlock a door if it is locked

  # Test that we cannot unlock a door if it is unlocked


end
