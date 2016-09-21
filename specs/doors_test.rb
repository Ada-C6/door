require_relative '../lib/doors.rb'
require_relative 'spec_helper.rb'

describe "Testing Doors" do

  it "A new instance of door is an object" do
    expect(Door.new.class).must_equal(object)
  end




end
