require_relative 'spec_helper'
require_relative '../lib/Door.rb'#file name(as same as class name)

describe Door do

#================initialize================
  #1
  it "Raise error when a door is initialized with both open and locked " do
    expect( proc {Door.new(true, true)} ).must_raise Door::IsOpenAndLockedError
  end
  #2
  it "Raise error when a door's inscription is not initialized with a string" do
    expect( proc {Door.new(false, false, 123)} ).must_raise Door::InscriptionIsNotString
  end
  #3
  it "Raise error when a door's is_open is not initialized with a Boolean" do
    expect( proc {Door.new("false", false, nil)} ).must_raise Door::IsOpenIsNotBoolean
  end
  #4
  it "Raise error when a door's is_locked is not initialized with a Boolean" do
    expect( proc {Door.new(false, nil, nil)} ).must_raise Door::IsLockedIsNotBoolean
  end
#===============write method=================
  #5
  it "Raise error when player try to write an non-string inscription " do
    d = Door.new
    expect( proc {d.write(123)} ).must_raise Door::InscriptionIsNotString
  end
  #6
  it "Raise error when player try to write an empty inscription " do
    d = Door.new
    expect( proc {d.write(nil)} ).must_raise Door::EmptyInscriptionError
    expect( proc {d.write("")} ).must_raise Door::EmptyInscriptionError
  end
  #7
  it "Raise error when player try to write on an inscripted door " do
    d = Door.new(false, false, "Castle")
    expect( proc {d.write("this is mine")} ).must_raise Door::HasInscriptionError
  end
  #8
  it "Player can write on the door when there is no inscription on that door" do
    d = Door.new(false, false, nil)
    d.write("Castle")
    expect( d.inscription ).must_equal("Castle")
  end

#===============open method==================
  #9
  it "Player can not open a door when the door is initialized as open" do
    d = Door.new(true, false, "Castle")
    expect( proc {d.open} ).must_raise Door::IsOpenError
  end
  #10
  it "Player can not open a door when the door is initialized as locked" do
    d = Door.new(false, true, "Castle")
    expect( proc {d.open} ).must_raise Door::IsLockedError
  end
  #11
  it "A door can be opened when the door is initialized as closed and not locked" do
    d = Door.new(false, false, "Castle")
    d.open
    expect( d.is_open ).must_equal(true)
  end
  #12
  it "A door can not be opened after it is locked" do
    d = Door.new(false, false, "Castle")
    d.lock
    expect( proc {d.open} ).must_raise Door::IsLockedError
  end
  #13
  it "A door can be opened when it is unlocked" do
    d = Door.new(false, true, "Castle")
    d.unlock
    d.open
    expect( d.is_open ).must_equal(true)
  end

#===============close method==================
  #14
  it "Player can not close a door when the door is initialized as closed" do
    d = Door.new(false, false, "Castle")
    expect( proc {d.close} ).must_raise Door::IsClosedError
  end
  #15
  it "Player can close a door when the door is initialized as open and not locked" do
    d = Door.new(true, false, "Castle")
    expect( d.close ).must_equal(false)
  end
  #16
  it "A door can be closed after it is unlocked" do
    d = Door.new(false, false, "Castle")
    d.lock
    d.unlock
    d.open
    d.close
    expect( d.is_open ).must_equal(false)
  end
  #===============lock method==================
  #17
  it "A door can not be locked when the door is initialized as opened" do
    d = Door.new(true, false, "Castle")
    expect( proc { d.open } ).must_raise Door::IsOpenError
  end
  #18
  it "A door can not be locked when the door is initialized as locked" do
    d = Door.new(false, true, "Castle")
    expect( proc { d.lock } ).must_raise Door::IsLockedError
  end
  #19
  it "A door can be locked when the door is initialized as open and not locked" do
    d = Door.new(false, false, "Castle")
    d.lock
    expect( d.is_locked ).must_equal(true)
  end
  #20
  it "A door can not be locked when the door is opened" do
    d = Door.new(false, false, "Castle")
    d.open
    expect( proc { d.lock } ).must_raise Door::IsOpenError
  end
  #21
  it "A door can be locked when the door is closed" do
    d = Door.new(false, false, "Castle")
    d.open
    d.close
    d.lock
    expect( d.is_locked ).must_equal(true)
  end
  #===============unlock method==================
  #22
  it "Player can not unlock a door when the door is initialized as unlocked" do
    d = Door.new(false, false, "Castle")
    expect( proc {d.unlock} ).must_raise Door::IsUnlockedError
  end
  #23
  it "Player can unlock a door when the door is initialized as closed and locked" do
    d = Door.new(false, true, "Castle")
    expect( d.unlock ).must_equal(false)
  end
  #24
  it "Player can unlock a door after the door is closed" do
    d = Door.new(true, false, "Castle")
    d.close
    d.lock
    d.unlock
    expect( d.is_locked ).must_equal(false)
  end
#===============show inscription==================
  #25
  it "The initialized inscription 'Castle' can be displayed" do
    d = Door.new(false, false, "Castle")
    expect( d.inscription ).must_equal("Castle")
  end
  #26
  it "The inscription 'Castle' can be displayed after the player write it" do
    d = Door.new(false, false, nil)
    d.write("Castle")
    expect( d.inscription ).must_equal("Castle")
  end
end
