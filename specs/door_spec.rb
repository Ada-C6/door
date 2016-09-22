require_relative 'spec_helper'
require_relative '../lib/door'

describe 'testing Door object and its attributes' do

  let(:door) { Door.new }

  it 'expect new Door to be an instance of Door' do
    expect(door.class).must_equal(Door)
  end

  it 'expect new Door to have attributes "inscription", "opened", "locked", which are readable' do
    expect( proc { door.inscription }).must_raise(NoMethodError)
    expect(door.opened).wont_equal(nil)
    expect(door.locked).wont_equal(nil)
    expect(door.bloop).wont_equal(nil)
  end

  it 'expect new Door to have no inscription' do
    expect(door.inscription).must_equal(nil)
  end

  it 'expect new Door to be closed' do
    expect(door.open?).must_equal(false)
  end

  it 'expect new Door to be locked' do
    expect(door.locked?).must_equal(true)
  end
end

# describe 'testing Door instance methods' do
#
#   it 'expect locked Door not to be openable' do
#   end
#
#   it 'expect unlocked Door to be openable' do
#
#   end
#
#   it 'expect open Door not to be openable' do
#
#   end
#
#   it 'expect open Door not to be lockable' do
#
#   end
#
#   it 'expect closed Door to be lockable' do
#
#   end
#
#   it 'expect closed Door to be openable' do
#
#   end
#
#   it 'expect closed Door not to be closeable' do
#
#   end
#
# end
