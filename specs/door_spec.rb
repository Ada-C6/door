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
    expect(bob.open_door).must_equal("Door already open!")

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

  it 'is_unlocked? must return correct state of door instance' do
    bob = Door.new
    expect(bob.is_unlocked?).must_equal(true)
  end

  it 'lock_door must set door to locked if conditions are met' do
    bob = Door.new
    bob.lock_door
    expect(bob.is_unlocked?).must_equal(false)
  end


  it 'unlock_door must set door to unlocked if conditions are met' do
    bob = Door.new
    bob.lock_door
    bob.unlock_door
    expect(bob.unlock_door).must_equal(true)
  end

end#end of test
