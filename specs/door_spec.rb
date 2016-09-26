require_relative 'spec_helper'

describe House::Door do

  describe '#initialize' do

    it "should create an instance of Door" do
      new_door = House::Door.new
      new_door.must_be_instance_of(House::Door)
    end
  end

  describe '#inscription' do

    it "should return the inscription on door" do
      new_door = House::Door.new
      new_door.inscription("Cats")
      new_door.door_message.must_equal("Cats")
    end

    it 'should return the initial empty inscription' do
      new_door = House::Door.new
      new_door.door_message.must_equal("")
    end

    it "should write inscription only once" do
      new_door = House::Door.new
      new_door.inscription("Cats")
      new_door.inscription("Dogs")
      new_door.door_message.must_equal("Cats")
    end

    it 'should not allow to write on an open door' do
      new_door = House::Door.new
      new_door.open
      new_door.inscription("Cats").must_equal("Cannot write on a door that is open!")
    end
  end

  describe '#closed?' do

    it 'should return initial variable assignment' do
      new_door = House::Door.new
      new_door.closed?.must_equal(true)
    end

    it 'should return false when open method is called' do
      new_door = House::Door.new
      new_door.open
      new_door.closed?.must_equal(false)
    end
  end

  describe '#locked?' do

    it 'should return initial variable assignment' do
      new_door = House::Door.new
      new_door.locked?.must_equal(false)
    end

    it 'should return true when lock method is called' do
      new_door = House::Door.new
      new_door.lock
      new_door.locked?.must_equal(true)
    end
  end

  describe '#open' do

    it 'should open only if its closed and unlocked' do
      new_door = House::Door.new
      new_door.open.must_equal("Door is now open")
    end

    it 'should say if its already open' do
      new_door = House::Door.new
      new_door.open
      new_door.open.must_equal("Door is already open")
    end

    it 'should say if its locked' do
      new_door = House::Door.new
      new_door.lock
      new_door.open.must_equal("Door is locked")
    end
  end

  describe '#closed' do

    it 'should close only if its open' do
      new_door = House::Door.new
      new_door.open
      new_door.close.must_equal("Door is now closed")
    end

    it 'should say if its already closed' do
      new_door = House::Door.new
      new_door.close.must_equal("Door is already closed")
    end
  end

  describe 'lock' do

    it 'should lock only if its unlocked' do
      new_door = House::Door.new
      new_door.lock.must_equal("Door is now locked")
    end

    it 'should say if its already locked' do
      new_door = House::Door.new
      new_door.lock
      new_door.lock.must_equal("Door is already locked")
    end
  end

  describe 'unlock' do

    it 'should unlock only if its locked' do
      new_door = House::Door.new
      new_door.lock
      new_door.unlock.must_equal("Door is now unlocked")
    end

    it 'should say if its already unlocked' do
      new_door = House::Door.new
      new_door.unlock.must_equal("Door is already unlocked")
    end
  end
end
