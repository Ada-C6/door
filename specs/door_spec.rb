#door_spec.rb
require_relative "Spec_helper"
require_relative "../lib/door"

describe "Testing door" do

let(:door_default) {Door.new}

  it "Confirm that a new door with default attributes can be created" do
    expect(door_default.class.must_equal(Door))
    expect(door_default.inscription.must_equal("Room A3"))
    expect(door_default.closed.must_equal(true))
    expect(door_default.locked.must_equal(true))
  end
end
