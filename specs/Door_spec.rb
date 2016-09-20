require_relative "Spec_helper"
require_relative "../lib/door.rb"

describe "Testing Door class" do

  it "A door can be made with the specified open/closed state, locked state, and inscription" do
    door1 = Door.new(true, true, "Here be dragons")
    expect(door1.is_open).must_equal(true)
    expect(door1.is_locked).must_equal(true)
    expect(door1.inscription).must_equal("Here be dragons")

    door2 = Door.new(false, false, "Sale: winter boots and scarves")
    expect(door2.is_open).must_equal(false)
    expect(door2.is_locked).must_equal(false)
    expect(door2.inscription).must_equal("Sale: winter boots and scarves")
  end

  it "A door can be made without an inscription" do
    door4 = Door.new(true, true)
    expect(door4.inscription).must_equal(nil)
  end

  it "A door without an inscription can have its inscription set" do
    door5 = Door.new(true, true)
    expect(door5.inscription).must_equal(nil)
    door5.inscription = "Enter at own risk"
    expect(door5.inscription).must_equal("Enter at own risk")
  end

  it "A door with an inscription cannot have its inscription changed" do
    door6 = Door.new(true, true, "Today's soup: Eel & chipmunk")
    expect(->{door6.inscription = "Enter at own risk"}).must_raise(RuntimeError)
  end

  it "A door can be opened if and only if it is closed and unlocked" do
    door7 = Door.new(false, false)
    expect(door7.is_open).must_equal(false)
    door7.open
    expect(door7.is_open).must_equal(true)
    door8 = Door.new(false, true)
    expect(->{door8.open}).must_raise(RuntimeError)
    door9 = Door.new(true, true)
    expect(->{door9.open}).must_raise(RuntimeError)
    door9 = Door.new(true, false)
    expect(->{door9.open}).must_raise(RuntimeError)
  end

  it "A door can be closed if and only if it is open" do
    door10 = Door.new(true, false)
    expect(door10.is_open).must_equal(true)
    door10.close
    expect(door10.is_open).must_equal(false)
    expect(->{door10.close}).must_raise(RuntimeError)
  end

  it "A door can be locked if and only if it is unlocked" do
    door10 = Door.new(false, false)
    expect(door10.is_locked).must_equal(false)
    door10.lock
    expect(door10.is_locked).must_equal(true)
    expect(->{door10.lock}).must_raise(RuntimeError)
  end

  it "A door can be unlocked if and only if it is locked" do
    door10 = Door.new(false, true)
    expect(door10.is_locked).must_equal(true)
    door10.unlock
    expect(door10.is_locked).must_equal(false)
    expect(->{door10.unlock}).must_raise(RuntimeError)
  end

end
