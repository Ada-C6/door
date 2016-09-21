require_relative 'Spec_helper'
require_relative '../door.rb'

describe Door do

  let( :an_open_door ) {Door.new}
  let ( :a_closed_door ) { Door.new("locked","closed","inscription") }
  let ( :closed_unlocked ) { Door.new("unlocked","closed",) }

  it 'create door objects & check default values' do
    expect ( an_open_door.class ).must_equal( Door )
    expect ( an_open_door.is_door_closed? ).must_equal( "Door is open." )
    # expect ( an_open_door.unlocked ).must_equal( true )
    # expect ( an_open_door.inscription ).must_equal( nil )
    expect ( a_closed_door.is_door_closed? ).must_equal( "Door is closed." )
    # expect ( a_closed_door.unlocked ).must_equal( false )
    # expect ( a_closed_door.inscription ).must_equal( "inscription" )
    expect ( closed_unlocked.is_door_closed? ).must_equal( "Door is closed." )
    # expect ( closed_unlocked.unlocked ).must_equal( true )
    # expect ( closed_unlocked.inscription ).must_equal( nil )
  end

  it 'opening and closing doors' do
    expect ( an_open_door.is_door_closed? ).must_equal( "Door is open." )
      an_open_door.close_door
    expect ( an_open_door.is_door_closed? ).must_match( "Door is closed.")
      an_open_door.open_door
    expect ( an_open_door.is_door_closed? ).must_equal( "Door is open." )

    expect ( a_closed_door.is_door_closed? ).must_match( "Door is closed." )
      a_closed_door.open_door
    expect ( a_closed_door.is_door_closed? ).must_match( "Door is open." )
      a_closed_door.close_door
    expect ( a_closed_door.is_door_closed? ).must_match( "Door is closed." )

    expect ( closed_unlocked.is_door_closed? ).must_match( "Door is closed." )
      closed_unlocked.open_door
    expect ( closed_unlocked.is_door_closed? ).must_match( "Door is open." )
      closed_unlocked.close_door
    expect ( closed_unlocked.is_door_closed? ).must_match( "Door is closed." )

    expect ( proc{ an_open_door.open_door } ).must_raise ArgumentError
    # expect ( opening_a_closed_door.open ).must_equal( true )
  end
end
