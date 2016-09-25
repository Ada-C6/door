require_relative 'spec_helper'
require_relative '../door'

describe Door do
  describe "#initialize" do
    it "can create a new instance of Door" do
      Door.new.must_be_instance_of(Door)
    end
    it "creates a closed door" do
      door = Door.new
      door.closed.must_equal(true)
    end
    it "creates an unlocked door" do
      door = Door.new
      door.locked.must_equal(false)
    end

    it "creates a door with no inscription" do
      door = Door.new
      door.inscription.must_equal(nil)
    end
  end

  describe "#open" do
    it "opens a closed door" do
      door = Door.new
      door.open
      door.closed.must_equal(false)
    end
    # it "raises and ArgumentError if door is already closed" do
    #   door = Door.new
    #
    # end
  end

  describe "#close" do
    it "closes an open door" do
      d = Door.new
      d.open
      d.close
      d.closed.must_equal(true)
    end
  end

end
