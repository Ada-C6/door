#door_spec.rb
require_relative "Spec_helper"
require_relative "../lib/door"

describe "Testing door" do

let(:closed_locked) {Door.new} #default door
#(inscription, closed, locked)
let(:closed_unlocked) {Door.new("Room A2", true, false)}
let(:open_locked) {Door.new("Room A3", false, true)}
let(:open_unlocked) {Door.new("Room A4", false, false)}

  it "Confirm that a new door with defaults can be created" do
    expect(closed_locked.class.must_equal(Door))
    expect(closed_locked.inscription.must_equal("Room A1"))
    expect(closed_locked.closed.must_equal(true))
    expect(closed_locked.locked.must_equal(true))
  end

  it "Confirm new doors with parameters can be created" do
      expect(closed_unlocked.class.must_equal(Door))
      expect(closed_unlocked.inscription.must_equal("Room A2"))
      expect(closed_unlocked.closed.must_equal(true))
      expect(closed_unlocked.locked.must_equal(false))

      expect(open_locked.class.must_equal(Door))
      expect(open_locked.inscription.must_equal("Room A3"))
      expect(open_locked.closed.must_equal(false))
      expect(open_locked.locked.must_equal(true))

      expect(open_unlocked.class.must_equal(Door))
      expect(open_unlocked.inscription.must_equal("Room A4"))
      expect(open_unlocked.closed.must_equal(false))
      expect(open_unlocked.locked.must_equal(false))
  end

  it "Confirm that only closed, unlocked doors can be opened" do
    expect (proc{open_unlocked.open_door}).must_raise Exception
    expect (proc{open_locked.open_door}).must_raise Exception
    expect (proc{closed_locked.open_door}).must_raise Exception
  end

  it "Confirm that opening a closed, unlocked door results in an open, unlocked door" do
  expect(closed_unlocked.closed.must_equal(true))
  closed_unlocked.open_door
  expect(closed_unlocked.closed.must_equal(false))
  end

end
