require_relative 'spec_helper'

describe Door do
    let(:d) {Door.new("sample_inscription")}
    describe "#initialize" do
        it "can create a new instance of Door" do
            d.must_be_instance_of(Door)
        end
        it "will assign parameter to inscription instance variable" do
            d.inscription.must_equal("sample_inscription")
        end
        it "will assign default instance variables accurately" do
            d.position.must_equal("closed")
            d.security.must_equal("locked")
        end
    end

    describe "unlock" do
        it "will unlock" do
            d.unlock.security.must_equal("unlocked")
        end
        it "must raise an ArgumentError if the door is already unlocked" do
            proc {d.unlock.unlock}.must_raise(ArgumentError)
        end
    end
end
