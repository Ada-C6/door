require_relative 'spec_helper'
require_relative '../lib/door'

describe 'Door' do

  before(:each) do
  @door_one = Door.new
  end

  describe '#initialize' do

    it "can create a new instance of a Door" do
      @door_one.must_be_instance_of(Door)
    end
  end

  describe '#inscription' do

    it 'should be allow you to write on the door if there is no inscription already and display the inscription' do
      @door_one.inscription("hyab").must_equal "hyab"
    end
    it 'should raise an ArgumentError if there is an inscription already written' do
      @door_one.inscription("wrting")
      proc {@door_one.inscription("hyab")}.must_raise(ArgumentError)
    end


  end
    # Once the writing (inscription) on a Door is set, it cannot be changed
    # it "it  "




end







# Once the writing (inscription) on a Door is set, it cannot be changed
# You may open a Door if and only if it is unlocked and closed
# You may close a Door if and only if it is open
# You may lock a Door if and only if it is unlocked
# You may unlock a Door if and only if it is locked
# # You should be able to check whether or not a Door is closed,
#  check whether or not it is locked, and look at the writing on the Door if there
#  is any.
