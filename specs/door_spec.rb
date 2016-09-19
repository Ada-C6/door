require_relative 'spec_helper'

describe Door do

  describe "#initialize" do
    it "should create an instance of Door" do
      Door.new("bathroom").must_be_instance_of Door
    end

    it "should create an unlocked door" do
      Door.new("bathroom").locked.must_equal false
    end

    it "should create an open door" do
      Door.new("bathroom").open.must_equal true
    end
  end


end
