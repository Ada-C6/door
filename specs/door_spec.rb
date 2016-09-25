require_relative 'spec_helper'
require_relative '../door.rb'

describe Door do
  describe "#initialize" do

    it "should create a new instance of Door" do
      a_door = Door.new(False, False)
      a_door.must_be_instance_of(Door)
    end

    it "should intialize with an open_status property" do

    end

    it "should have an open_status property of either true or false" do

    end

    it "should initialize with a locked_status property" do

    end

    it "should have a locked_status property of either true or false" do

    end

  end


end
