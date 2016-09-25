#Door Class Spec

require 'spec_helper'

describe 'Testing Door Class' do
  door1 = Door.new

  it 'testing to ensure nil is returned as text for new Door initialized with defaults' do
    expect door1.text.must_equal(nil)
  end

  it 'testing to ensure true is returned as ajar for new Door initialized with defaults' do
    expect door1.ajar.must_equal(true)
  end

  it 'testing to ensure false is returned as locked for new Door initialized with defaults' do
    expect door1.locked.must_equal(false)
  end

  it 'testing to ensure a door in default state can be closed' do
    door2 = Door.new
    expect door2.shut("close").must_equal(false)
  end

  it 'testing to ensure a door in default state can be locked' do
    door3 = Door.new
    expect door3.latch("lock").must_equal(true)
  end

  it 'testing to ensure text can be set for new Door initialized with defaults' do
    door4 = Door.new
    expect door4.inscription("I am a door").must_equal("I am a door")
  end

  it 'testing to ensure text is not changed for a door with text that has already been set' do
    door5 = Door.new
    door5.inscription("I am a door")
    expect door5.inscription("I am not a door").must_equal("I am a door")
  end

  it 'testing to ensure a door cannot be opened it if it is locked' do
    door6 = Door.new
    door6.latch("lock")
    expect(proc {door6.shut("open")}).must_raise ArgumentError
  end

  it 'testing to ensure a door cannot be locked it it is already locked' do
    door7 = Door.new
    door7.latch("lock")
    expect(proc {door7.latch("lock")}).must_raise ArgumentError
  end
end
