require_relative '../door'
require_relative 'spec_helper'

describe Door do
  let(:new_door_1) { Door.new("Kelly!", true, false) }
  let(:new_door_2) { Door.new("Kelly!", false, true) }
  let(:new_door_3) { "Kelly!" } # this is an object of String class

  describe "#initialize" do
    it "should verify if the object is an instance of Door class" do
      new_door_1.must_be_instance_of(Door)
      new_door_3.wont_be_instance_of(Door)
    end

    it "should return the correct values of instance variables" do
      new_door_1.inscription.must_equal("Kelly!")
      new_door_2.inscription.wont_equal("hello")
      new_door_1.is_open.must_equal(true)
      new_door_2.is_locked.wont_equal(false)
    end
  end


end
