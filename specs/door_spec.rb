require_relative 'spec_helper'

describe "door" do
  before (:each) do
    @door = Door.new
  end

  describe "#initialize" do
    it "can create a new instance of Door" do
      @door.must_be_instance_of(Door)
    end
  end

  describe "set_inscription" do
    it "should set the inscription variable to a non-nil value if it is currently nil" do
      @door.set_inscription("Your Message Here").must_equal("Your Message Here")
    end

    it "should not allow the inscription to be changed once set" do
      @door.set_inscription("Your Message Here")
      @door.set_inscription("Can I do the Thing?").wont_equal("Can I do the Thing?")
    end
  end

end
