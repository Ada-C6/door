require_relative 'spec_helper'
require_relative '../door'

describe Door do
  before (:all) do
    @d = Door.new(true, false)
  end

  describe "#initialize" do
    it "should create a new instance of Door" do
      @d.must_be_instance_of(Door)
    end
  end

  describe "#inscribe(message)" do

    before(:all) do
      @d = Door.new(true, false)
      @d.inscribe("HEY GURL")
    end

    it "should inscribe the correct string" do
      @d.inscription.must_equal("HEY GURL")
    end

    it "should raise an ArgumentError if the message is already inscribed" do
      proc { @d.inscribe("NEW MESSAGE") }.must_raise(ArgumentError)
    end
  end
end
