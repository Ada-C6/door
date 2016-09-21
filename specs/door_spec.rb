# door_specs.rb

# A Door object can
#
# display an inscription
# be either open or closed, and
# be either locked or unlocked
# Here are some rules about how Doors work:

# You should write specs for this class, to achieve at least 90% test coverage (using simplecov).


require_relative 'spec_helper.rb'

require_relative '../lib/door.rb'

describe 'Test Door' do

  # This is an example let statement
  let(:door) { Door.new("Door Inscription") }

  it "Test that a new door is an instance of the door class" do
    expect(door.class).must_equal(Door)
  end

  it "Test that a new door requires an inscription" do
    expect( proc {Door.new} ).must_raise(ArgumentError)
  end

  it "Test that a new door defaults to closed and locked" do
    test_door = Door.new("Door 1")
    expect(test_door.closed?).must_equal(true)
    expect(test_door.locked?).must_equal(true)
  end

  it "Test that a new door can be instantiated in a custom configuration" do
    test_door = Door.new("Test Door", true, true)
  end

  it "Test that a new door cannot be instantiated both open and locked" do
    expect( proc {Door.new("Test Door", false, true)}).must_raise(ArgumentError)
  end



  # You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.

  it "Test that we can access the door's open/closed status" do
    expect(door.closed?).must_equal(true || false)
  end

  it "Test that a user cannot simply override the open/closed status" do
    expect( proc {door.closed == true}).must_raise(NoMethodError)
  end

  it "Test that we can access the door's locked/unlocked status" do
    expect(door.locked?).must_equal(true || false)
  end

  it "Test that a user cannot simply override the locked/unlocked status" do
    expect( proc {door.locked == true}).must_raise(NoMethodError)
  end

  it "Test that we can read the inscription on the door" do
    expect(door.inscription).must_equal("Door Inscription")
  end



  # Once the writing (inscription) on a Door is set, it cannot be changed

  it "Test that we cannot change the inscription of the door" do
    expect( proc {door.inscription = "New Inscription"}).must_raise(NoMethodError)
  end



  # Door.new(Inscription, Closed = true, Locked = true)
  # You may open a Door if and only if it is unlocked and closed
  # Appropriate error messages should be displayed and no changes to the Door should be made condition is violated.

  it "Test that we can open a door if it is closed and unlocked" do
    test_door = Door.new("Inscription", true, false)
    test_door.open
    expect(test_door.closed?).must_equal(false)
  end

  it "Test that we cannot open a door if it is not closed" do
    test_door = Door.new("Inscription", false, false)
    expect(test_door.open).must_equal("Door is already open")
  end

  it "Test that we cannot open a door if it is not unlocked" do
    test_door = Door.new("Inscription", true, true)
    expect(test_door.open).must_equal("Door is locked")
  end



  # Door.new(Inscription, Closed = true, Locked = true)
  # You may close a Door if and only if it is open
  # Appropriate error messages should be displayed and no changes to the Door should be made condition is violated.

  it "Test that we can close a door it if is open" do
    test_door = Door.new("Inscription", false, false)
    test_door.close
    expect(test_door.closed?).must_equal(true)
  end

  it "Test that we cannot close a door if it is closed" do
    test_door = Door.new("Inscription", true, false)
    expect(test_door.close).must_equal("Door is already closed")
  end



  # Door.new(Inscription, Closed = true, Locked = true)
  # You may lock a Door if and only if it is unlocked
  # You may unlock a Door if and only if it is locked
  # Appropriate error messages should be displayed and no changes to the Door should be made condition is violated.

  it "Test that we can lock a door if it is unlocked" do
    test_door = Door.new("Inscription", true, false)
    test_door.lock
    expect(test_door.locked?).must_equal(true)
  end

  it "Test that we cannot lock a door if it is locked" do
    test_door = Door.new("Inscription", true, true)
    expect(test_door.lock).must_equal("Door is already locked")
  end

  it "Test that we can unlock a door if it is locked" do
    test_door = Door.new("Inscription", true, true)
    test_door.unlock
    expect(test_door.locked?).must_equal(false)
  end

  it "Test that we cannot unlock a door if it is unlocked" do
    test_door = Door.new("Inscription", true, false)
    expect(test_door.unlock).must_equal("Door is already unlocked")
  end

  it "Test that we cannot lock a door if it is open" do
    test_door = Door.new("Inscription", false, false)
    expect(test_door.lock).must_equal("Open door cannot be locked")
  end

  # CAN YOU LOCK AN OPEN DOOR?

end
