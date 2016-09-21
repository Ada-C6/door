require_relative 'Spec_helper'
require_relative '../door.rb'

describe Door do

  let( :an_open_door ) {Door.new}

  it '1- create a door object & check default values' do
    expect ( an_open_door.class ).must_equal( Door )
    expect ( an_open_door.open ).must_equal( true )
    expect ( an_open_door.unlocked ).must_equal( true )
    expect ( an_open_door.inscription ).must_equal( false )
  end

  it '2- checks is_door_closed? method' do
    expect ( an_open_door.is_door_closed? ).must_match( "Door is open." )
  end

end
