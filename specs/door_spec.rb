require_relative './spec_helper'

describe Door do
  # Door instance that is opened and locked
  # with default inscription
  let(:open_locked_door) { Door.new(true, true) }
  let(:inscribed_door) { Door.new(true, true, "None Shall Write!") }
  let(:closed_unlocked_door) {Door.new(false, false)}


  it "Exists" do
    Door.wont_be_nil
  end

  # You should be able to check whether or not a Door is:
  describe "Door#is_open" do
    # Closed
    it "Can be either open or closed" do
      refute_nil(open_locked_door.is_open)
    end
  end
  describe "Door#is_locked" do
    # Check whether or not it is locked,
    it "Can be either locked or unlocked" do
      refute_nil(open_locked_door.is_locked)
    end
  end
  describe "Door#inscription" do
    # And look at the writing on the Door if there is any.
    it "Can have an inscription" do
      refute_nil(open_locked_door.inscription)
    end
  end


  describe "Door#inscribe" do
    # Once the writing (inscription) on a Door is set,
    # it cannot be changed
    words = "Hello World!"
    it "Can be inscribed" do
      assert_equal words, open_locked_door.inscribe(words)
    end

    it "Inscriptions on doors cannot be changed" do
      assert_raises(Exception) {inscribed_door.inscribe(words)}
    end
  end

  describe "Door#open" do
    # May open a Door if and only if it is
    # unlocked and
    # closed
    it "Cannot be opened if already open" do
      assert_raises(Exception) {open_locked_door.open}
    end

    it "Must be closed and unlocked to be opened" do
      assert_equal true, closed_unlocked_door.open
    end
  end

  describe "Door#close" do
    # May close a Door if and only if it is open
    it "Cannot be closed if it already closed" do
      assert_raises(Exception) {closed_unlocked_door.close}
    end

    it "Must be opened to be closed" do
      assert_equal false, open_locked_door.close
    end
  end

  describe "Door#lock" do
    # May lock a Door if and only if it is unlocked
    it "Cannot be locked if it is already locked" do
      assert_raises(Exception) {open_locked_door.lock}
    end

    it "Must be unlocked to be locked" do
      assert_equal true, closed_unlocked_door.lock
    end
  end

  describe "Door#unlock" do
    # May unlock a Door if and only if it is locked
    it "Cannot be unlocked if it is already unlocked" do
      assert_raises(Exception) {closed_unlocked_door.unlock}
    end
    it "Must be locked to be unlocked" do
      assert_equal false, open_locked_door.unlock
    end
  end

end
