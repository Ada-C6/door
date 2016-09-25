require_relative 'spec_helper.rb'
require_relative '../door.rb'

describe 'creating a Door object' do
  let(:door) {Door.new}
  let(:door2) {Door.new("Test")}
  let(:door3) {Door.new(2)}

  it 'must create a Door with the default inscription when no argument is passed' do
    expect(door.inscription).must_equal("A-door-able")
  end

  it 'must create a Door with a custom inscription when one argument is passed' do
    expect(door2.inscription).must_equal("Test")
  end

  it 'must have a string as the inscription' do
    expect(door2.inscription.class).must_equal(String)
  end

  it 'must raise an error if too many arguments are given' do
    proc{Door.new("test", true, true)}.must_raise(ArgumentError)
  end

  it 'must not allow re-writing of the inscription' do
    proc{door.inscription = "New"}.must_raise(NoMethodError)
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

describe 'method for displaying an inscription' do
  let(:door) {Door.new}

  it 'must display the inscription string when called' do
    proc{door.get_inscription}.must_output ("A-door-able")
  end
end

describe 'method for displaying the door status' do
  let(:door) {Door.new}

  it 'must display the status with open/close, unlocked/locked, and inscription' do
    proc{door.get_status}.must_output (
    "Here is the door's status...
    Open: true
    Unlocked: true
    Inscription: A-door-able")
  end

end
