require_relative 'spec_helper.rb'
require_relative '../lib/doors.rb'

describe "Testing Doors" do

  # I am going off the idea of a door with the lock in the knob. In a dungeon. Like we're playing a tabletop game.


  let (:door_one){Door.new("Beware of the Leopard")}
  #closed & unlocked

  let (:door_two){Door.new("Free ice cream inside - definitely not a trap", "ajar")}
  #ajar & unlocked

  let (:door_three){Door.new("Do not unlock - zombie horde on other side", nil, "locked")}
  #closed & locked

  let (:door_four){Door.new("Do not close - prank in progress", "ajar", "locked")}
  #ajar & locked

  let (:door_five){Door.new}


  it "1. A new door is an instance of door" do
    expect(door_one).must_be_instance_of(Door)
  end

  it "1.5 A new door has a default inscription of 'Private' if no inscription is created with the door" do
    expect(door_five.door_inscription).must_equal("Private")
  end

  it "2. The inscription on the door can be viewed, but not changed" do
    expect(door_one.view_inscription).must_equal("Beware of the Leopard")
    expect(proc{door_one.door_inscription = "Attempting to change inscription"}).must_raise NoMethodError
  end

  it "3. A new instance of door starts with a default unlocked and closed door" do
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

  it "8. A closed, unlocked door may be opened" do
    door_one.ajar
    expect(door_one.door_state).must_equal("ajar")
    # closed & unlocked
  end

  it "9. A closed, locked door may not be opened" do
    expect(proc{door_three.ajar}).must_raise ArgumentError
    # closed & locked
  end

  it "10. An open, unlocked door may be closed" do
    door_two.close
    expect(door_two.door_state).must_equal("closed")
    # ajar & unlocked
  end

  it "11. An open, locked door may be closed" do
    door_four.close
    expect(door_four.door_state).must_equal("closed")
    # ajar & locked
  end

  it "12. An open, unlocked door may be locked" do
    door_two.lock
    expect(door_two.lock_state).must_equal("locked")
    # ajar & unlocked
  end

  it "13. A closed, unlocked door may be locked" do
    door_one.lock
    expect(door_one.lock_state).must_equal("locked")
    # closed & unlocked
  end

  it "14. A closed, locked door may be unlocked even if it isn't a very smart idea" do
    door_three.unlock
    expect(door_three.lock_state).must_equal("unlocked")
    # closed & locked
  end

  it "15. An open, locked door may be unlocked" do
    door_four.unlock
    expect(door_four.lock_state).must_equal("unlocked")
    # ajar & locked
  end

  it "16. Check to see if a door is ajar or closed, locked or unlocked" do
    expect(door_two.door_state).must_equal("ajar" || "closed")
    expect(door_two.lock_state).must_equal("unlocked")
  end

end
