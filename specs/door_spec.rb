require_relative 'spec_helper'

describe Door do
  let (:d) {Door.new}

  describe "#initialize" do
    it "should create a new instance of Door" do
      d.must_be_instance_of(Door)
    end
  end
end
