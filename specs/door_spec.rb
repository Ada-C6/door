require_relative 'spec_helper.rb'
require_relative '../door.rb'

describe 'method for displaying an inscription' do

  let(:door) {Door.new}

  it 'must display the inscription string when called' do
    expect(door.get_inscription).must_equal("This shall not be changed.")
    expect(door.get_inscription).must_be_kind_of(String)
  end
end

describe 'method for opening a door' do

  let(:door) {Door.new}

  it 'must open the door when it is unlocked & closed' do
    door.close_door
    door.open_door

    expect(door.is_open).must_equal(true)
  end

  it 'must not open the door when it is locked' do
    door.close_door
    door.lock_door

    proc{door.open_door}.must_raise(RuntimeError)
  end

  it 'must not open the door when it is open' do
    proc{door.open_door}.must_raise(RuntimeError)
  end
end

describe 'method for closing a door' do

  let(:door) {Door.new}

  it 'must close the door when it is open' do
    door.close_door

    expect(door.is_open).must_equal(false)
  end

  it 'must not close the door when it is closed' do
    door.close_door

    proc{door.close_door}.must_raise(RuntimeError)
  end
end

describe 'method for locking a door' do

    let(:door) {Door.new}

    it 'must lock the door when it is unlocked & closed' do
      door.close_door
      door.lock_door

      expect(door.is_unlocked).must_equal(false)
    end

    it 'must not lock the door when it is locked' do
      door.close_door
      door.lock_door

      proc{door.lock_door}.must_raise(RuntimeError)
    end

    it 'must not open the door when it is open' do
      proc{door.lock_door}.must_raise(RuntimeError)
    end
end

describe 'method for unlocking a door' do

    let(:door) {Door.new}

    it 'must lock the door when it is unlocked & closed' do
      door.close_door
      door.lock_door
      door.unlock_door

      expect(door.is_unlocked).must_equal(true)
    end

    it 'must not unlock the door when it is unlocked' do
      door.close_door

      proc{door.unlock_door}.must_raise(RuntimeError)
    end

    it 'must not open the door when it is open' do
      proc{door.unlock_door}.must_raise(RuntimeError)
    end
end

describe 'method for displaying the door status' do

  let(:door) {Door.new}

  it 'must display if a door is open/closed' do
    expect(door.get_status).must_include("Open:")
  end

  it 'must display if a door is unlocked/locked' do
    expect(door.get_status).must_include("Unlocked:")
  end

  it 'must display if door inscription' do
    expect(door.get_status).must_include("This shall not be changed.")
  end

  it 'must display a string' do
    expect(door.get_status.class).must_equal(String)
  end
end

  # - display an inscription
  # - be either open or closed, and
  # - be either locked or unlocked
  #
  # Here are some rules about how Doors work:
  #
  # - Once the writing (inscription) on a Door is set, it cannot be changed
  # - You may open a Door if and only if it is unlocked and closed
  # - You may close a Door if and only if it is open
  # - You may lock a Door if and only if it is unlocked
  # - You may unlock a Door if and only if it is locked
  # - You should be able to check whether or not a Door is closed, check whether or not it is locked, and look at the writing on the Door if there is any.
  #
  # Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
