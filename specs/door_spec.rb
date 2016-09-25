require_relative 'spec_helper'
require_relative '../lib/door'

describe 'Door' do

# let(:door) {Door.new  }
  before(:each) do
  @door_one = Door.new(false, true)
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

  describe '#door_open' do
    it 'should open the door if the door is unlocked, but closed' do
      @open = false
      @unlocked = true
      @door_one.door_open.must_equal true
    end
   it 'should raise an ArgumentError if the door is locked' do
      @door_one = Door.new(false, false)
      proc {@door_one.door_open}.must_raise(ArgumentError)
   end
   it 'should raise an ArgumentError if the door is open' do
      @door_one = Door.new(true, true)
      proc {@door_one.door_open}.must_raise(ArgumentError)
   end

  end

  describe '#door_close' do
    it 'should close the door if the door is open' do
    @door_one = Door.new(true, true)
      @door_one.door_close.must_equal false
    end
   it 'should raise an ArgumentError if the door is closed' do
      @door_one = Door.new(false, false)
      proc {@door_one.door_close}.must_raise(ArgumentError)
   end
  end


end





# You may close a Door if and only if it is open
# You may lock a Door if and only if it is unlocked
# You may unlock a Door if and only if it is locked
# # You should be able to check whether or not a Door is closed,
#  check whether or not it is locked, and look at the writing on the Door if there
#  is any.
