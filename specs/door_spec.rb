require_relative 'Spec_helper'
require_relative '../door.rb'

describe Door do

  let( :an_open_door ) {Door.new}

  it '1- create a door object' do
    expect ( an_open_door.class ).must_equal( Door )
  end


end
