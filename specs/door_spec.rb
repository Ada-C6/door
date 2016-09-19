require 'spec_helper.rb'
require 'door.rb'


describe "Testing door" do
  it "Creates a new instance of door" do

    locked = true
    closed = true
    INSCRIPTION = "Pull"

    quotidian_door = Door.new(locked, closed, INSCRIPTION)

    quotidian_door.must_be_kind_of Door
    quotidian_door.locked.must_equal locked
    quotidian_door.closed.must_equal closed
    quotidian_door.INSCRIPTION.must_equal INSCRIPTION

  end

  it "Tests that a closed and unlocked door can be opened" do
    quotidian_door = Door.new(false, true, "Pull")
    quotidian_door.closed.must_equal true
    quotidian_door.open_door.must_be_kind_of String
    quotidian_door.closed.must_equal false
  end

end