require_relative 'spec_helper'

describe Door do
    describe "#initialize" do
        it "can create a new instance of Door" do
            Door.new.must_be_instance_of(Door)
        end
    end
end
