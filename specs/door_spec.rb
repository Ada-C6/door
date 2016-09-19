require_relative 'spec_helper.rb'
require_relative '../lib/door.rb'


describe "Testing door" do
  it "Creates a new instance of door" do

    locked = true
    closed = true
    INSCRIPTION = "Pull"

    quotidian_door = Door.new(locked, closed, INSCRIPTION)

    quotidian_door.must_be_kind_of Door
    # quotidian_door.open.must_equal open
    # quotidian_door.inscribe.must_equal inscribe

    quotidian_door.locked.must_equal locked
    quotidian_door.closed.must_equal closed
    quotidian_door.INSCRIPTION.must_equal INSCRIPTION

  end

  
end