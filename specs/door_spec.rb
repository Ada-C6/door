require_relative 'spec_helper'
require_relative '../door'

class Door
  describe "#initialize" do
  let(:door) {Door.new("you shall not pass!")}
    it "should create an instance of a door" do
      door.must_be_instance_of(Door)
    end

    it "should be given an inscrption at inception with an inscrption attribute" do
      door.must_respond_to(:inscription)
    end

    # it "should not allow for its inscription to be written over" do
    #
    # end
  end

  describe "#locked?" do
    let(:door) {Door.new("this is a door.")}
    it "should be locked at default" do
      door.locked?.must_equal(true)
    end
  end

  describe "#unlock" do
    let(:door) {Door.new("this is a door.")}
    it "should raise an error if the door is already unlocked" do
      proc {door.lock = false}.must_raise Exception
    end
    it "should be unlock when door is locked" do
      door.unlock.must_equal("door is now unlocked. Yay.")
    end

    it "should tell user it is already unlocked when unlocked" do
      door.lock = false
      door.unlock.must_equal("Door is already unlocked.")
    end


  end

end #end class
