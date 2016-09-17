require_relative 'spec_helper'
require_relative '../door'

describe Door do
  let(:door_test1) {Door.new("closed", "locked", "zion")}
  let(:door_test2) {Door.new("closed", "unlocked", "")}
  let(:door_test3) {Door.new("open", "unlocked", "")}
  let(:door_test4) {Door.new("open", "locked","zion")}

  describe "#initialize" do
    # door_test = Door.new("zion", "closed", "locked")
    it "should create a new instance" do
      door_test1.must_be_instance_of(Door)
    end
  end

  describe "#open" do
    it "should open the door(ie return true) if it is unlocked and currently closed" do
      #let(:door_test2) {Door.new("closed", "unlocked", "")}
      door_test2.open.must_equal("open")
    end

    it "should not open the door(ie raise argument) if it is unlocked and currently open" do
      #let(:door_test3) {Door.new("open", "unlocked", "")}
      proc {door_test3.open}.must_raise(ArgumentError)
    end

    it "should not open the door(ie raise argument) if it is locked and currently closed" do
      #let(:door_test1) {Door.new("closed", "locked", "zion")}
      proc {door_test1.open}.must_raise(ArgumentError)
    end

    it "should not open the door(ie raise argument) if it is locked and currently open" do
      #  let(:door_test4) {Door.new("open", "locked","zion")}
      proc {door_test4.open}.must_raise(ArgumentError)
    end
  end

  describe "#close" do
    it "should close the door(ie return true) if it is currently open" do
      #let(:door_test3) {Door.new("open", "unlocked", "")}
      door_test3.close.must_equal("closed")
    end

    it "should not close the door(ie raise argument) if it is currently closed" do
      #let(:door_test2) {Door.new("closed", "unlocked", "")}
      proc {door_test2.close}.must_raise(ArgumentError)
    end
  end

  describe "#lock" do
    it "should lock the door(ie return true) if it is currently unlocked" do
      #let(:door_test2) {Door.new("closed", "unlocked", "")}
      door_test2.lock.must_equal("locked")
    end

    it "should not lock the door(ie raise argument) if it is currently locked" do
      #let(:door_test1) {Door.new("closed", "locked", "zion")}
      proc {door_test1.lock}.must_raise(ArgumentError)
    end
  end

  describe "#unlock" do
    it "should unlock the door(ie return true) if it is currently locked" do
      # let(:door_test1) {Door.new("closed", "locked","zion")}
      door_test1.unlock.must_equal("unlocked")
    end

    it "should not unlock the door(ie raise argument) if it is currently unlocked" do
      # let(:door_test2) {Door.new("closed", "unlocked","zion")}
      proc {door_test2.unlock}.must_raise(ArgumentError)
    end
  end

  describe "#inscription?" do
    it "should return true if there is an inscription on the door" do
      # let(:door_test1) {Door.new(, "closed", "locked","zion")}
      door_test1.inscription?.must_equal(true)
    end

    it "should return false if there is not an inscription on the door" do
      # let(:door_test2) {Door.new("closed", "unlocked","")}
      door_test2.inscription?.must_equal(false)
    end
  end

  describe "#read" do
    it "should return true if the correct inscription is returned for the door" do
      # let(:door_test4) {Door.new("open", "locked","zion")}
      door_test4.read.must_equal("zion")
    end

    it "should raise an errer if there is no inscription on the door" do
      # let(:door_test3) {Door.new("open", "unlocked", "")}
      proc {door_test3.read}.must_raise(ArgumentError)
    end
  end
end
