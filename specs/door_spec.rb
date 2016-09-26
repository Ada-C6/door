require_relative 'spec_helper'
require_relative '../lib/door'

describe 'Door' do

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
      @door_one.door_close
      @door_one.open.must_equal false
    end

    it 'should raise an ArgumentError if the door is closed' do
      @door_one = Door.new(false, false)
      proc {@door_one.door_close}.must_raise(ArgumentError)
    end
  end

  describe '#door_lock' do

    it 'should lock the door if the door is unlocked' do
      @door_one = Door.new(false, true)
      @door_one.door_locked
      @door_one.unlocked.must_equal false
    end

    it 'should raise an ArgumentError if the door is locked' do
      @door_one = Door.new(false, false)
      proc {@door_one.door_locked}.must_raise(ArgumentError)
    end
  end

  describe '#door_unlock' do

    it 'should unlock a door if and only if it is locked' do
      @door_one = Door.new(false, false)
      @door_one.door_unlock
      @door_one.unlocked.must_equal true
    end

    it 'should raise an ArgumentError if the door is already unlocked' do
      @door_one = Door.new(false, true)
      proc{@door_one.door_unlock}.must_raise(ArgumentError)
    end
  end

  describe '#open' do

    it 'should check whether the door is closed' do
      @door_one = Door.new(true, true)
      @door_one.door_close
      @door_one.open.must_equal false
    end

    it 'should check whether the door is closed' do
      @door_one = Door.new(true, true)
      @door_one.open.must_equal true
    end
  end

  describe '#unlocked' do

    it 'should check whether the door is locked' do
      @door_one = Door.new(true, true)
      @door_one.door_locked
      @door_one.unlocked.must_equal false
    end

    it 'should check whether the door is locked' do
      @door_one = Door.new(true, true)
      @door_one.unlocked.must_equal true
    end
  end

  describe '#writing' do

    it 'should check whether there is a wrting on the Door and return the wrting' do
      @door_one.inscription("Hyab")
      @door_one.writing.must_equal "Hyab"
    end

    it 'should check whether there is a wrting on the Door and return the wrting' do
      @door_one.writing.must_equal ""
    end
  end
end
