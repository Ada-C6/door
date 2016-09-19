require_relative 'spec_helper'
require_relative '../door'

describe Door do
  describe "#initialize" do
    let(:door) { Door.new }

    it "can create a new instance of Game" do
      door.must_be_instance_of(Door)
    end
  end

  describe "#open_if_allowed" do
    let(:door) { Door.new }

    it "should raise an Argument Error if locked? is true" do
      proc { door.open_if_allowed }.must_raise(ArgumentError)
    end

    it "should raise an Argument Error if closed? is true" do
      proc { door.open_if_allowed }.must_raise(ArgumentError)
    end
  end

  describe "#close_if_allowed" do
    let(:door) { Door.new }

    it "should raise an Argument Error if locked? is true" do
      proc { door.close_if_allowed }.must_raise(ArgumentError)
    end

    it "should raise an Argument Error if closed? is true" do
      proc { door.close_if_allowed }.must_raise(ArgumentError)
    end
  end

  describe "#unlock_door" do
    let (:door) { Door.new }

    it "should raise an Argument Error if locked? is false" do
      proc { door.open_if_allowed }.must_raise(ArgumentError)
    end

    it "should allow the user to unlock the door" do
      door.unlock_door.must_equal(false)
    end

    describe "#lock_door" do
      let (:door) { Door.new }

      it "should raise an Argument Error if locked? is true" do
        proc { door.lock_door }.must_raise(ArgumentError)
      end

      it "should allow the user to lock the door" do
        if @locked == false
          door.lock_door.must_equal(true)
        end
      end
    end


  end
end
