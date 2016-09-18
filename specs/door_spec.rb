require_relative 'spec_helper'
require_relative '../door'

describe Door do
  describe "#initialize" do
    it "should initialize a new instance of Door" do
      sample = Door.new("I'm a door", true, true)
      sample.must_be_instance_of(Door)
    end
  end







end
