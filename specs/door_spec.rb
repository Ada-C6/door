require_relative 'spec_helper'
require_relative '../door.rb'

describe Door do
  let(:door) { Door.new }

  describe "#initialize" do
    it "creates a new instance of Door" do
      door.must_be_instance_of(Door)
    end
  end

end 
