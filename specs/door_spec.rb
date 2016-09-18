require_relative 'spec_helper'
# require_relative '../door.rb'

describe Door do

  describe "#initialize" do
    let(:door) { Door.new }

    it "can create a new instance of Door" do
      door.must_be_instance_of(Door)
    end

    it "should allow user to check if door is closed" do
      door.must_respond_to(:closed)
    end

    it "should allow user to check if door is locked" do
      door.locked.class.must_equal(FalseClass)
    end

    it "should initialize with an empty inscription" do
      door.inscription.must_be(:==, "")
    end

  end

  # describe "#closed?" do
  #   it "should check if "
  #
  #
  # end

end
