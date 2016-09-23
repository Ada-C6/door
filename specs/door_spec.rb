require_relative 'Spec_helper'
require_relative '../door.rb'

describe Door do

  let( :an_open_door ) {Door.new}
  let ( :a_closed_door ) { Door.new("locked","closed","inscription") }
  let ( :closed_unlocked ) { Door.new("unlocked","closed",) }
  let ( :door_initialized_wrong ) { Door.new("l","o",) }
  # let ( :door_initialized_wrong ) { Door.new("l","o",) }

  it 'create door objects & check default values' do
    expect ( an_open_door.class ).must_equal( Door )
    expect ( an_open_door.is_door_open? ).must_equal( true )
    expect ( an_open_door.is_door_unlocked? ).must_equal( true )
    expect ( an_open_door.is_there_inscription? ).must_equal( false )

    expect ( a_closed_door.is_door_open? ).must_equal( false )
    expect ( a_closed_door.is_door_unlocked? ).must_equal( false )
    expect ( a_closed_door.is_there_inscription? ).must_equal( true )

    expect ( closed_unlocked.is_door_open? ).must_equal( false )
    expect ( closed_unlocked.is_door_unlocked? ).must_equal( true )
    expect ( closed_unlocked.is_there_inscription? ).must_equal( false )
  end

  it 'an unlocked, open, no inscription door' do
    expect ( an_open_door.is_door_open? ).must_equal( true )
      an_open_door.close_door
    expect ( an_open_door.is_door_open? ).must_equal( false )
    expect ( proc{ an_open_door.unlock_door } ).must_raise ArgumentError
      an_open_door.open_door
    expect ( an_open_door.is_door_open? ).must_equal( true )
    expect ( an_open_door.is_door_unlocked? ).must_equal( true )
      an_open_door.close_door
      an_open_door.lock_door
    expect ( an_open_door.is_door_unlocked? ).must_equal( false )
    expect ( an_open_door.is_door_open? ).must_equal( false )
      an_open_door.unlock_door
    expect ( an_open_door.is_door_unlocked? ).must_equal( true )
      an_open_door.open_door
    expect ( an_open_door.is_door_open? ).must_equal( true )
    expect ( proc{ an_open_door.lock_door } ).must_raise ArgumentError
    expect ( proc{ an_open_door.open_door } ).must_raise ArgumentError
    expect ( an_open_door.is_there_inscription? ).must_equal( false )
    expect ( an_open_door.read_inscription ).must_match( "There is no inscription" )
  end

  it 'locked, closed, with inscription door' do
    expect ( a_closed_door.is_door_open? ).must_equal( false )
    expect ( proc{ a_closed_door.lock_door } ).must_raise( ArgumentError )
    expect ( proc{ a_closed_door.close_door } ).must_raise( ArgumentError )
    expect ( proc { a_closed_door.open_door } ).must_raise( ArgumentError )
      a_closed_door.unlock_door
    expect ( a_closed_door.is_door_unlocked? ).must_equal( true )
      a_closed_door.open_door
    expect ( a_closed_door.is_door_open? ).must_equal( true )
      a_closed_door.close_door
      a_closed_door.lock_door
    expect ( a_closed_door.is_door_unlocked? ).must_equal( false )
    expect ( proc{ a_closed_door.open_door } ).must_raise ArgumentError
    expect ( a_closed_door.is_there_inscription? ).must_equal ( true )
    expect ( a_closed_door.read_inscription ).must_match ( "The door is inscribed with this message: inscription" )
  end

  it 'unlocked, closed, no inscription door' do
    expect ( closed_unlocked.is_door_open? ).must_equal( false )
      closed_unlocked.lock_door
    expect ( closed_unlocked.is_door_unlocked? ).must_equal( false )
      closed_unlocked.unlock_door
    expect ( closed_unlocked.is_door_unlocked? ).must_equal( true )
      closed_unlocked.open_door
    expect ( closed_unlocked.is_door_open? ).must_equal( true )
      closed_unlocked.close_door
    expect ( closed_unlocked.is_door_open? ).must_equal( false )
    expect ( closed_unlocked.is_door_unlocked? ).must_equal( true )
      closed_unlocked.lock_door
    expect ( closed_unlocked.is_door_unlocked? ).must_equal( false )
      closed_unlocked.unlock_door
    expect ( closed_unlocked.is_door_unlocked? ).must_equal( true )
    expect ( closed_unlocked.is_there_inscription? ).must_equal( false )
    expect ( closed_unlocked.read_inscription ).must_match( "There is no inscription" )
  end

  it 'door initialized incorrectly' do
    expect ( proc{ door_initialized_wrong.is_door_open? } ).must_raise ArgumentError # NOT SURE WHY THIS TEST FAILS
    expect ( door_initialized_wrong.is_there_inscription? ).must_equal( false )
    expect ( proc{ door_initialized_wrong.lock_door } ).must_raise ArgumentError
    expect ( proc{ door_initialized_wrong.unlock_door } ).must_raise ArgumentError

  end
end
