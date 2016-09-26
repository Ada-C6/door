require_relative 'spec_helper'
require_relative '../door.rb'

describe Door do
  let(:door) { Door.new }

  describe "#initialize" do
    it "creates a new instance of Door" do
      door.must_be_instance_of(Door)
    end
  end

  describe "#inscribe" do
    d = Door.new
    d.inscribe("YOLO")

    it "should inscribe a message" do
      d.inscription.must_equal("YOLO")
    end

    it "should raise an ArgumentError if the message is already inscribed" do
      proc { d.inscribe("Carpe Diem") }.must_raise(ArgumentError)
    end
  end
end
