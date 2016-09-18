require_relative 'spec_helper'
# require_relative '../door.rb'

describe Door do
  let(:door) { Door.new }

  describe "#initialize" do

    it "can create a new instance of Door" do
      door.must_be_instance_of(Door)
    end

    it "should allow user to check if door is closed" do
      door.must_respond_to(:closed)
    end

    it "should allow user to check if door is locked" do
      door.locked.class.must_equal(FalseClass)
    end

    it "should initialize without an inscription string" do
      door.inscription.must_be(:==, nil)
    end

  end

  describe "#inscribe" do
    inscribed_door = Door.new
    inscribed_door.inscribe("welcome")

    it "should allow user to set the inscription" do
      inscribed_door.inscription.must_equal("welcome")
    end

    it "should raise an error if user tries to set an inscription when one already exists" do
      proc { inscribed_door.inscribe("goodbye") }.must_raise(StandardError)
    end

# does this do what I think it does??? how does proc work?
    it "should not allow the user to set an inscription if one already exists" do
      proc { inscribed_door.inscribe("goodbye") }
      inscribed_door.inscription.must_equal("welcome")
    end

  end

  # before(:each) do
  #   @door = Door.new
  # end
end
