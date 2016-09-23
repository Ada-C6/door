require_relative '../door'
require_relative 'spec_helper'

describe Door do
  let(:new_door_1) { Door.new("Kelly!", true, false) }
  let(:new_door_2) { Door.new("Kelly!", false, true) }
  let(:new_door_3) { "Kelly!" } # this is an object of String class
  let(:new_door_4) { Door.new("Kelly!", false, false) }

  describe "#initialize" do
    it "should verify if the object is an instance of Door class" do
      new_door_1.must_be_instance_of(Door)
      new_door_3.wont_be_instance_of(Door)
    end

    it "should return the correct values of instance variables" do
      new_door_1.inscription.must_equal("Kelly!")
      new_door_2.inscription.wont_equal("hello")
      new_door_1.is_open.must_equal(true)
      new_door_2.is_locked.wont_equal(false)
    end
  end

  describe "open" do
    it "should open a Door if and only if it is unlocked and closed" do
      new_door_4.open.must_equal(true)
      new_door_2.open.wont_equal(true)
    end

    it "should not change the Door if someone tries to open a locked door" do
      new_door_2.open.must_be_nil
    end
  end

  describe "close" do
    it "should close a Door if and only if it is open" do
      new_door_1.close.must_equal(false)
      new_door_2.close.wont_equal(false)
    end

    it "should not change the Door if someone tries to close it even though it's already closed" do
      new_door_2.close.must_be_nil
    end
  end

  describe "lock" do
    it "should lock a Door if and only if it is unlocked" do
      new_door_1.lock.must_equal(true)
      new_door_2.lock.wont_equal(true)
    end

    it "should not change the Door if someone tries lock it even though it's already locked" do
      new_door_2.lock.must_be_nil
    end
  end

  describe "unlocked" do
    it "should unlock a Door if and only if it is locked" do
      new_door_1.unlock.wont_equal(false)
      new_door_2.unlock.must_equal(false)
    end

    it "should not change the Door if someone tries to unlock it even though it's already unlocked" do
      new_door_4.unlock.must_be_nil
    end
  end
end
