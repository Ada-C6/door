require_relative 'Spec_helper'
require_relative '../door_mod.rb'

describe 'Testing Door class with defaults' do
  let(:treasure_door) {Door.new("Enter at your own risk")}
  let(:treasure_door_unlocked) {treasure_door.unlock_door}

  it "must be a closed Door" do
    expect treasure_door.state.must_equal "closed"
  end

  it "must be a locked door" do
    expect treasure_door.l_state.must_equal "locked"
  end

  it "must not be able to change inscription" do
    proc {treasure_door.inscription("Welcome")}.must_raise(InscriptionError "inscription can not be changed")
  end

  it "must return an error message if user attempts to open a locked door" do
    proc {treasure_door.open_door}.must_raise(LStatusError "The door is locked")
  end

  it "must return an error message if user attempts to close an already closed door" do
    proc {treasure_door.close_door}.must_raise (StatusError "Door already closed")
  end

  it "must return a message when the user successfully opens a door" do
    expect treasure_door_unlocked.open_door.must_output "You have opened the door"
  end

  it "must return a message when the user successfully unlocks a door" do
    expect treasure_door.unlock_door.must_output "You have unlocked the door"
  end

end

describe 'Testing Door class with open and unlocked states' do
  let(:portal_door) {Door.new("Enter into an alternate reality", state="open", l_state="unlocked")}

  it "must allow the user to create a new door that is open" do
    expect portal_door.status.must_equal "open"
  end

  it "must allow the user to create a new door that is unlocked" do
    expect portal_door.l_status.must_equal "unlocked"
  end

  it "must return an error message if the user attempts to open an already open door" do
    proc {portal_door.open_door}.must_raise (StatusError "Door already open")
  end

  it "must return an error message if the user attempts to unlock an unlocked door" do
    proc {portal_door.unlock_door}.must_raise (LStatusError "Door already unlocked")
  end

  it "must return a message when the user has closed a door" do
    expect portal_door.close_door.must_output "You have closed the door"
  end

  it "must return a message when the user has locked a door" do
    expect portal_door.lock_door.must_output "you have locked the door"
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
