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
end # end of object & attr testing

describe 'testing Door inscribe method' do

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

end # end of inscribe

describe 'testing Door open_door method' do

  let(:door) { Door.new }

  it 'expect locked Door cannot be opened' do
    door.lock unless door.locked? == true
    expect( proc { door.open_door }).must_raise(TypeError)
  end

  it 'expect open Door cannot be opened' do
    door.unlock unless door.locked? == false
    door.open_door unless door.open? == true
    expect( proc{ door.open_door}).must_raise(TypeError)
  end

  it 'expect unlocked, closed Door can be opened' do
    door.unlock unless door.locked? == false
    door.close unless door.open? == false
    door.open_door
    expect(door.open?).must_equal(true)
  end
end # end of open

describe 'testing Door close method' do

  let(:door) { Door.new }

  it 'expect closed Door cannot be closed' do
    door.close unless door.open? == false
    expect( proc{ door.close }).must_raise(TypeError)
  end

  it 'expect open Door can be closed' do
    door.unlock unless door.locked? == false
    door.open_door unless door.open? == true
    door.close
    expect(door.open?).must_equal(false)
  end

end # end of close

describe 'testing Door lock method' do

  let(:door) { Door.new }

  it 'expect open Door cannot be locked' do
    door.unlock unless door.locked? == false
    door.open_door unless door.open? == true
    expect(proc{ door.lock }).must_raise(TypeError)
  end

  it 'expect closed Door can be locked' do
    door.unlock unless door.locked? == false
    door.close unless door.open? == false
    door.lock
    expect(door.locked?).must_equal(true)
  end

  it 'expect locked Door cannot be locked' do
    door.lock unless door.locked? == true
    expect(proc{ door.lock }).must_raise(TypeError)
  end

end # end of lock method

describe 'testing Door unlock method' do

  let(:door) { Door.new }

  it 'expect open Door cannot be unlocked (because open Doors cannot be locked)' do
    door.unlock unless door.locked? == false
    door.open_door unless door.open? == true
    expect(proc{ door.unlock }).must_raise(TypeError)
  end

  it 'expect locked Door can be unlocked' do
    door.lock unless door.locked? == true
    door.unlock
    expect(door.locked?).must_equal(false)
  end

  it 'expect unlocked Door cannot be unlocked' do
    door.unlock unless door.locked? == false
    expect(proc{ door.unlock }).must_raise(TypeError)
  end

end
