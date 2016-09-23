require_relative 'Spec_helper'
require_relative '../lib/door.rb'

describe 'Testing Door class with defaults' do
  let(:treasure_door) {Door.new("Enter at your own risk")}

  it "must be a closed Door" do
    expect treasure_door.state.must_equal "closed"
  end

  it "must be a locked door" do
    expect treasure_door.l_state.must_equal "locked"
  end

  it "must not be able to change inscription" do
    proc {treasure_door.inscription("Welcome")}.must_raise(ArgumentError)
  end

  it "must return an error message if user attempts to open a locked door" do
    expect treasure_door.open_door.must_equal "The door is locked"
  end

  it "must return an error message if user attempts to close an already closed door" do
    expect treasure_door.close_door.must_equal "The door is already closed"
  end

  it "must return a message when the user successfully opens a door" do
    expect treasure_door.open_door.must_equal "You have opened the door"
  end

  it "must return a message when the user successfully unlocks a door" do
    expect treasure_door.unlock_door.must_equal "You have ulocked the door"
  end

end

describe 'Testing Door class with open and unlocked states' do
  let(:portal_door) {Door.new("Enter into an alternate reality", state = "open", l_state = "unlocked")}

  it "must allow the user to create a new door that is open" do
    expect portal_door.must_equal "open"
  end

  it "must allow the user to create a new door that is unlocked" do
    expect portal_door.must_equal "unlocked"
  end

  it "must return an error message if the user attempts to open an already open door" do
    expect portal_door.open_door.must_equal "Door already open"
  end

  it "must return an error message if the user attempts to unlock an unlocked door" do
    expect portal_door.unlock_door.must_equal "Door already unlocked"
  end

  it "must return an error messge if the user attempts to open a locked door" do
    expect portal_door.lock_door.must_equal "Can not open a locked door"
  end

  it "must return a message when the user has closed a door" do
    expect portal_door.close_door.must_equal "You have closed the door"
  end

  it "must return a message when the user has locked a door" do
    expect portal_door.lock_door.must_equal "you have locked the door"
  end

  it "must allow the user to check the state of a door" do
    expect portal_door.state.must_equal "open"
  end

  it "must allow the user to check the locked state of a door" do
    expect portal_door.l_state.must_equal "unlocked"
  end

  it "must allow the reader to check the inscription of a door" do
    expect portal_door.inscription.must_equal "Enter into an alternate reality"
  end

end
