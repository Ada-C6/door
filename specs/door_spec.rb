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

    it "should have a locked_status property" do
      @a_door.must_respond_to(:locked_status)
    end

    it "should tell a user if the door is open or closed" do
      @a_door.open_status.must_equal(false)
    end

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

    it "should change the open_status to open if the door was unlocked and closed" do
      door_one.open.must_equal(true)
    end
  end

  describe "#close" do
    let(:closed_door) {Door.new(false, false)} #closed and unlocked
    let(:door_z) {Door.new(true, false)}

    it "should raise an error if the door is already closed" do
      closed_door = Door.new(false, false)
      proc { closed_door.close }.must_raise(ArgumentError)
    end

    it "should change the open_status to closed if the door was open" do
      door_z.close.must_equal(false)
    end
  end

  describe "#lock" do
    let(:locked_door) {Door.new(false, true)} #closed and locked
    let(:open_door) {Door.new(true, false)}
    let(:unlocked_door) {Door.new(false, false)}

    it "should raise an error if the door is already locked" do
      proc { locked_door.lock }.must_raise(ArgumentError)
    end

    it "should raise an error if the door is already open" do
      proc { open_door.open }.must_raise(ArgumentError)
    end

    it "should change locked_status if previously unlocked" do
      unlocked_door.lock.must_equal(true)
    end
  end

  describe "#unlock" do
    let(:closed_unlocked_door) {Door.new(false, false)} #closed and unlocked
    let(:open_door) {Door.new(true, false)}
    let(:locked_door) {Door.new(false, true)}

    it "should raise an error if the door is already unlocked" do
      proc { closed_unlocked_door.unlock }.must_raise(ArgumentError)
    end

    it "should raise an error if the door is already open" do
      proc { open_door.unlock }.must_raise(ArgumentError)
    end

    it "should change locked_status if previously locked" do
      locked_door.unlock.must_equal(false)
    end
  end

  describe "#inscribe" do
    let(:door_x) {Door.new(false, true, "La Puerta")}
    let(:door_y) {Door.new(false, true)}

    it "should raise an error if an inscription change is attempted" do
      proc { door_x.inscribe("Home") }.must_raise(ArgumentError)
    end

    it "should change the inscription if one hasn't been set yet" do
      door_y.inscribe("Home")
    end
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
