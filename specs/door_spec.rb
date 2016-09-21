require_relative 'spec_helper'
require_relative '../lib/Door.rb'#file name(as same as class name)

describe Door do

#================initialize================
  it "Raise error when a door is initialized with both open and locked " do
    expect( proc {Door.new(true, true)} ).must_raise Door::IsOpenAndLockedError
  end

  it "Raise error when a door's inscription is not initialized with a string" do
    expect( proc {Door.new(false, false, 123)} ).must_raise Door::InscriptionIsNotString
  end

  it "Raise error when a door's is_open is not initialized with a Boolean" do
    expect( proc {Door.new("false", false, nil)} ).must_raise Door::IsOpenIsNotBoolean
  end

  it "Raise error when a door's is_locked is not initialized with a Boolean" do
    expect( proc {Door.new(false, nil, nil)} ).must_raise Door::IsLockedIsNotBoolean
  end
#===============write method=================
  it "Raise error when player try to write an non-string inscription " do
    d = Door.new
    expect( proc {d.write(123)} ).must_raise Door::InscriptionIsNotString
  end

  it "Raise error when player try to write an empty inscription " do
    d = Door.new
    expect( proc {d.write(nil)} ).must_raise Door::EmptyInscriptionError
    expect( proc {d.write("")} ).must_raise Door::EmptyInscriptionError
  end

  # major conflicts among argument checking!! refacter it!!
  it "Raise error when player try to write on an inscripted door " do
    d = Door.new("Castle")
    expect( proc {d.write("this is mine")} ).must_raise Door::HasInscriptionError
  end

  it "Player can write on the door when there is no inscription on that door" do
    d = Door.new(false, false, nil)
    d.write("Castle")
    expect( d.inscription ).must_equal("Castle")
  end

#===============open method==================

  it "Player can not open a door when the door is initialized open" do
    d = Door.new(true, false, "Castle")
    expect( proc {d.open} ).must_raise Door::IsOpenError
  end

  it "Player can not open a door when the door is initialized locked" do
    d = Door.new(false, true, "Castle")
    expect( proc {d.open} ).must_raise Door::IsLockedError
  end

  it "A door can be opened when the door is closed and not locked" do
    d = Door.new(false, false, "Castle")
    d.open
    expect( d.is_open ).must_equal(true)
  end

  it "A door can not be opened when it is locked" do
    d = Door.new(false, false, "Castle")
    d.lock
    expect( proc {d.open} ).must_raise Door::IsLockedError
  end

  it "A door can be opened when it is unlocked" do
    d = Door.new(false, true, "Castle")
    d.unlock
    d.open
    expect( d.is_open ).must_equal(true)
  end

#=========

end
