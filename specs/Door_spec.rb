#Door_spec.rb

require_relative 'Spec_helper'
require_relative '../lib/Door'


describe 'Testing Door' do
  let(:new_door) { Door.new("Secret Garden") }


#############--------------Door Tests--------------------###########

  it "Must be a door" do
    expect(new_door).must_be_instance_of(Door)
  end

  it "Must be able to check door inscription, whether closed or open, and locked or unlocked" do
    expect(new_door.inscription).must_equal("Secret Garden")
    expect(new_door.closed).must_equal(true)
    expect(new_door.locked).must_equal(true)
  end

  it "Door must open if and only if it is unlocked and closed" do
    proc {new_door.open_door}.must_raise(ArgumentError)
    new_door.unlock
    expect(new_door.open_door).must_equal(false)
    proc {new_door.open_door}.must_raise(ArgumentError)
  end

  it "Door must close if and only if it is open" do
    new_door.unlock
    proc {new_door.close_door}.must_raise(ArgumentError)
    new_door.open_door
    expect(new_door.close_door).must_equal(true)
  end

  it "Door must lock if and only if it is unlocked" do
    proc {new_door.lock}.must_raise(ArgumentError)
    new_door.unlock
    expect(new_door.lock).must_equal(true)
  end

  it "Door must unlock if and only if it is locked" do
    expect(new_door.unlock).must_equal(false)
    proc {new_door.unlock}.must_raise(ArgumentError)
  end

end
