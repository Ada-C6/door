require_relative 'spec_helper'
require_relative '../lib/door'

describe 'testing Door object and its attributes' do

  let(:door) { Door.new }

  it 'expect new Door to be an instance of Door' do
    expect(door.class).must_equal(Door)
  end

  it 'expect new Door to have attributes "inscription", "opened", "locked", which are readable' do
    expect(door.inscription.class).must_equal(NilClass || String)
    expect(door.opened).wont_equal(nil)
    expect(door.locked).wont_equal(nil)
  end

  it 'expect new Door not to have random attributes that do not exist' do
    expect( proc { door.bloop } ).must_raise(NoMethodError)
    expect( proc { door.lseijgsk } ).must_raise(NoMethodError)
    expect( proc { door.cats   } ).must_raise(NoMethodError)
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

describe 'testing Door instance methods' do

  let(:door) { Door.new }

  it 'expect Door with no inscription to be able to be inscribed' do
    door.inscribe("Lauren is great at Ruby")
    expect(door.inscription).must_equal("Lauren is great at Ruby")
  end

  it 'expect Door with inscription to raise error' do
    door.inscribe("Hello this is an inscription")
    expect( proc { door.inscribe("here is another inscription") } ).must_raise(TypeError)
    expect( proc { door.inscribe("what if we try it again?") }).must_raise(TypeError)
  end

  it 'expect inscribe to raise ArgError if a non-string is given' do
    expect( proc { door.inscribe(798765667) }).must_raise(ArgumentError)
    expect( proc { door.inscribe(["3","4","5"]) }).must_raise(ArgumentError)
  end

  # it 'expect locked Door not to be openable' do
  #   door.lock
  #   expect( proc { door.open_door }).must_raise()
  # end
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
end
