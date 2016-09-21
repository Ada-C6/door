require_relative 'spec_helper'



# @todo would like to see more negative tests, what-if

module Dungeon
  describe Door do

    describe "#initialize" do
      let(:door) { Door.new(:lock_status) }

      it "can create an object of Door" do
        door.must_be_instance_of(Door)
      end

      it "should respond to parameters of door status" do
        door.must_respond_to(:lock_status)
        door.must_respond_to(:inscription)
      end

    it "should be a closed door that initializes" do
      door.closed.must_equal(true)
    end

    end #init

    describe "#the rest" do



      it "should display an inscription, if there is one written" do
        skip
      end

      it "should be possible to open, when closed and unlocked" do
        skip
      end

      it "should be possible to close a door, if open" do
        skip
      end

      it "should be possible to lock or unlock, if closed, by switching state" do
        skip
      end

      it "should be possible to inscribe the door only once" do
        skip
      end

      it "should be possible to inspect a door for its state of open/closed" do
        skip
      end

      it "should be possible to inspect a door for its state of locked/unlocked" do
        skip
      end

      it "should be possible to inspect a door to read the inscription" do
        skip
      end

      it "should give a warning message if the door is used in the wrong way" do
        # check for warning for opening a locked door without first unlocked
        # check for warning for changing the inscription when there is already once
        # check for warning for closing/opening an already closed/open door
        skip
      end
    end #method
  end #Door
end #mod
