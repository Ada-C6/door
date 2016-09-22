require_relative 'spec_helper'

describe OpenDoor do
  describe "#initialize" do

    it "can create a new instance of an open door" do
        skip
      fridge = OpenDoor.new
      fridge.must_be_instance_of(OpenDoor)
    end
    it "returns the current state of the door" do
      skip
    fridge = OpenDoor.new
    fridge.must_respond_to(:state)
    end
  end
  describe "#slam" do
    it "can change the state of the door" do
      skip
      fridge = OpenDoor.new
      fridge.slam
      fridge.state.must_be_instance_of(ClosedDoor)
    end
  end
end
