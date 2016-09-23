require_relative 'Spec_helper'
require_relative '../lib/door'

describe Door do

  let (:door1){
    Door.new(inscription: "Welcome to our home!", open_status: true, unlocked_status: true)
  }
  let (:door2){
    Door.new(inscription: "Beware!", open_status: false, unlocked_status: true)
  }


#1
  it "Makes sure you can create a door object with several attributes and check those attributes" do
    expect(door1.inscription).must_equal("Welcome to our home!")
    expect(door1.open_status).must_equal(true)
    expect(door1.unlocked_status).must_equal(true)
  end

#2
  it "You may open a Door if and only if it is unlocked and closed" do
    expect(door1.opens).must_equal("You cannot proceed beyond this point.")
    expect(door2.opens).must_equal("Please proceed with caution.")
  end

#3
  it "You may close a Door if and only if it is open" do
    expect(door1.close).must_equal("The door is now closed.")
    expect(door2.close).must_equal("The door is already closed!")
  end

#4
  it "You may lock a Door if and only if it is unlocked" do
    expect(door1.lock).must_equal("The door is now locked.")
    expect(door2.lock).must_equal("The door is already locked!")
  end

#5
  it "You may unlock a Door if and only if it is locked" do
    expect(door1.lock).must_equal("The door is already unlocked!")
    expect(door2.lock).must_equal("The door is now unlocked.")
  end

#6
  it "Once the writing (inscription) on a Door is set, it cannot be changed" do
    expect(door1.inscription).must_equal("Welcome to our home!")
    expect(door2.inscription).must_equal("Beware!")
  end

end
