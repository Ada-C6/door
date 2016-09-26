require_relative 'spec_helper'
require_relative '../door.rb'

describe Door do
  describe "#initialize" do
    # before (:each) do
    #   a_door = Door.new#(False, False)
    # end

    it "should create a new instance of Door" do
      a_door = Door.new(false, false)
      a_door.must_be_instance_of(Door)
    end

    it "should have an open_status property" do
      a_door = Door.new(false, true)
      a_door.must_respond_to(:open_status)
    end

    # it "should have an open_status property of either true or false" do
    #   :open_status.must_be_kind_of(Boolean)
    # end

    it "should have a locked_status property" do
      a_door = Door.new(true, false)
      a_door.must_respond_to(:locked_status)
    end
    #
    # # it "should have a locked_status property of either true or false" do
    # #
    # # end
  end

  describe "#open" do
    it "should raise an error if the door is already open" do
      a_door = Door.new(true, false)
      proc { a_door.open }.must_raise(ArgumentError)
    end

    it "should raise an error if the door is locked" do
      a_door = Door.new(false, true)
      proc { a_door.open }.must_raise(ArgumentError)
    end

    # it "should open the door by changing the open_status to true" do
    #
    # end
  end

  describe "#close" do
    it "should raise an error if the door is already closed" do
      a_door = Door.new(false, false)
      proc { a_door.open }.must_raise(ArgumentError)
    end

    # it "should close the door by changing the open_status to false" do
    #
    # end
  end
end
