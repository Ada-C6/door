require_relative '../lib/doors.rb'
require_relative 'spec_helper.rb'

describe "Testing Doors" do

  # I am going off the idea of a door with the lock in the knob.


  let (:door_one){Door.new("Beware of the Leopard")}
  #closed & unlocked

  let (:door_two){Door.new("Free ice cream inside - definitely not a trap", "ajar")}
  #ajar & unlocked

  let (:door_three){Door.new("Do not unlock - zombie horde on other side", nil, "locked")}
  #closed & locked

  let (:door_four){Door.new("Do not close - prank in progress", "ajar", "locked")}
  #ajar & locked


  it "1. A new instance of door is an object" do
    expect(door_one).must_be_instance_of(Door)
  end

  it "2. The inscription on the door can be viewed, but not changed" do
    expect(door_one.view_inscription).must_equal("Beware of the Leopard")
    # expect(door_one.door_inscription = "Attempting to change inscription").must_raise NoMethodError
  end

  it "3. A new instance of door starts with an unlocked and closed door" do
    expect(door_one.door_state).must_equal("closed")
    expect(door_one.lock_state).must_equal("unlocked")
  end

  it "4. Raises an ArgumentError when trying to unlock an unlocked door" do
    expect(proc{door_one.unlock}).must_raise ArgumentError
  end

  it "5. Raises an ArgumentError when trying to close a closed door" do
    expect(proc{door_one.close}).must_raise ArgumentError
  end

  it "6. Raises an ArgumentError when trying to open an ajar door" do
    expect(proc{door_two.ajar}).must_raise ArgumentError
  end

  it "7. Raises an ArgumentError when trying to lock a locked door" do
    expect(proc{door_three.lock}).must_raise ArgumentError
  end

  it "8. An unlocked door may be ajar" do
    door_one.ajar
    expect(door_one.door_state).must_equal("ajar")
    # closed & unlocked
  end

end
