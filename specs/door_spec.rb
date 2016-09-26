require_relative 'spec_helper'
require_relative '../door.rb'

describe Door do
  describe "#initialize" do
    before (:each) do
      @a_door = Door.new(false, true)
    end

    it "should create a new instance of Door" do
      @a_door.must_be_instance_of(Door)
    end

    it "should have an open_status property" do
      @a_door.must_respond_to(:open_status)
    end

    # it "should have an open_status property of either true or false" do
    #   :open_status.must_be_kind_of(Boolean)
    # end

    it "should have a locked_status property" do
      @a_door.must_respond_to(:locked_status)
    end
    #
    # # it "should have a locked_status property of either true or false" do
    # #
    # # end
  end

  describe "#open" do
    let(:door_one) {Door.new(false, false)} #closed and unlocked
    let(:door_two) {Door.new(false, true)} #closed and locked
    let(:door_three) {Door.new(true, false)} #open and unlocked

    it "should raise an error if the door is already open" do
      proc { door_three.open }.must_raise(ArgumentError)
    end

    it "should raise an error if the door is locked" do
      proc { door_two.open }.must_raise(ArgumentError)
    end

    # it "should open the door by changing the open_status to true" do
    #   door_one.open
    #   door_one.open_status.must_equal(true)
    # end
  end

  describe "#close" do
    let(:closed_door) {Door.new(false, false)} #closed and unlocked

    it "should raise an error if the door is already closed" do
      closed_door = Door.new(false, false)
      proc { closed_door.close }.must_raise(ArgumentError)
    end

    # it "should close the door by changing the open_status to false" do
    #
    # end
  end

  describe "#lock" do
    let(:locked_door) {Door.new(false, true)} #closed and locked

    it "should raise an error if the door is already locked" do
      proc { locked_door.lock }.must_raise(ArgumentError)
    end

    # it "should lock the door by changing the locked_status to true" do
    #   a_door = Door.new(false, false)
    #   a_door.lock.must_equal(true)
    # end
  end

  describe "#unlock" do
    let(:closed_unlocked_door) {Door.new(false, false)} #closed and unlocked

    it "should raise an error if the door is already unlocked" do
      proc { closed_unlocked_door.unlock }.must_raise(ArgumentError)
    end

    # it "should unlock the door by changing the locked status to false" do
    #
    # end
  end

  describe "#read" do
    let(:door_four) {Door.new(false, true, "Alohomora")}
    let(:door_five) {Door.new(false, true)}

    it "should return true if there is an inscription on the door" do
      door_four.read.must_equal(true)
    end

    it "should return false if there is no inscription on the door" do
      door_five.read.must_equal(false)
    end

  end
end
