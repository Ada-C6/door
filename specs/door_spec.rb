require_relative 'Spec_helper'
require_relative '../lib/door'

describe Door do

  let (:door1){
    Door.new(inscription: "Welcome to our home!", open_status: true, unlocked_status: true)
  }
  let (:door2){
    Door.new(inscription: "Beware!", open_status: false, unlocked_status: true)
  }
  let (:door3){
    Door.new(inscription: "Hello!", open_status: false, unlocked_status: false)
  }


#1
  it "Makes sure you can create a door object with several attributes and check those attributes" do
    expect(door1.inscription).must_equal("Welcome to our home!")
    expect(door1.open_status).must_equal(true)
    expect(door1.unlocked_status).must_equal(true)
  end

#2
  it "You may open a Door if and only if it is unlocked and closed" do
    proc {door1.opens}.must_raise(ArgumentError)
    expect(door2.opens).must_equal(true)
    expect(door1.open_status).must_equal(true)
  end

#3
  it "You may close a Door if and only if it is open" do
    expect(door1.close).must_equal(false)
    proc {door2.close}.must_raise(ArgumentError)
    expect(door2.open_status).must_equal(false)
  end

#4
  it "You may lock a Door if and only if it is unlocked" do
    expect(door1.lock).must_equal(false)
    proc {door3.lock}.must_raise(ArgumentError)
    expect(door3.unlocked_status).must_equal(false)
  end

#5
  it "You may unlock a Door if and only if it is locked" do
    expect(door3.unlock).must_equal(true)
    proc {door1.unlock}.must_raise(ArgumentError)
    expect(door1.unlocked_status).must_equal(true)
  end

#6
  it "Once the writing (inscription) on a Door is set, it cannot be changed" do
    door1[:inscription] = "Come on in!"
    door2[:inscription] = "Just kidding...but seriously...BEWARE!"
    expect(door1.inscription).must_equal("Welcome to our home!")
    expect(door2.inscription).must_equal("Beware!")
  end

end
