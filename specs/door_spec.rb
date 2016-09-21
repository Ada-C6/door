require_relative 'spec_helper'
require_relative '../lib/door'

describe 'Test of Door class' do

  it 'new instance of door must contain defaults when no parameters are passed in' do
    bob = Door.new
    expect(bob.open).must_equal(true)
    expect(bob.unlocked).must_equal(true)
    expect(bob.inscription).must_equal(nil)
  end

  it 'is_open? must return correct state of door instance' do
    bob = Door.new
    bob.close_door
    expect(bob.is_open?).must_equal(false)

  end

  it 'open_door must set door instance to open if conditions are met' do
    bob = Door.new
    expect( proc {bob.open_door}).must_raise(RuntimeError)

  end

  it 'open_door must set door instance to open if conditions are met' do
    bob = Door.new
    bob.close_door
    expect(bob.open_door).must_equal(true)

  end

  it 'close_door must set door instance to "closed" if conditions are met' do
    bob = Door.new(open = true, unlocked = true, incription = nil)
    expect(bob.close_door).must_equal(false)

  end

  it 'close_door must raise error if conditions are not met to set to door instance to close' do
    bob = Door.new
    bob.close_door
    expect( proc {bob.close_door}).must_raise(RuntimeError)

  end


  it 'is_unlocked? must return correct state of door instance' do
    bob = Door.new
    expect(bob.is_unlocked?).must_equal(true)
  end

  it 'lock_door must set door to locked if conditions are met' do
    bob = Door.new
    bob.lock_door
    expect(bob.is_unlocked?).must_equal(false)
  end

  it 'lock_door must raise error if conditions are not met to set to door instance to locked' do
    bob = Door.new
    bob.lock_door
    expect( proc {bob.lock_door}).must_raise(RuntimeError)

  end

  it 'check_inscription must raise error if conditions are not met to set to door instance inscription' do
    bob = Door.new(true, true, "Set if off")
    expect( proc {bob.check_inscription("It's my party")}).must_raise(RuntimeError)

  end

  it 'check_inscription must set to door instance inscription if conditions are met' do
    bob = Door.new(true, true, nil)
    bob.check_inscription("It's my party")
    expect(bob.inscription).must_equal("It's my party")

  end

  it 'unlock_door must set door to unlocked if conditions are met' do
    bob = Door.new
    bob.lock_door
    bob.unlock_door
    expect(bob.unlock_door).must_equal(true)
  end

  it 'unlock_door must raise error if conditions are not met to set to door instance to locked' do
    bob = Door.new
    expect( proc {bob.unlock_door}).must_raise(RuntimeError)

  end

end#end of test
