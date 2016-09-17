require_relative 'spec_helper'
require_relative 'door'
class Door
  describe "#initialize" do
    it "should create an instance of a door" do
      let(:door) { Door.new}
      door.must_be_instance_of(Door)
    end
  end
end
