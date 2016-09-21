require_relative './spec_helper'

describe Door do
  # Door instance that is opened and locked
  # with default inscription
  let(:door) { Door.new(true, true) }
  let(:inscribed_door) { Door.new(true, true, "None Shall Write!") }
  let(:closed_unlocked) {Door.new(false, false)}


  it "Exists" do
    Door.wont_be_nil
  end

  describe "Door#inscription" do
    it "Can have an inscription" do
      refute_nil(door.inscription)
    end
  end

  describe "Door#is_open" do
    it "Can be either open or closed" do
      refute_nil(door.is_open)
    end
  end

  describe "Door#is_locked" do
    it "Can be either locked or unlocked" do
      refute_nil(door.is_locked)
    end
  end

  describe "Door#inscribe" do
    # Once the writing (inscription) on a Door is set,
    # it cannot be changed
    words = "Hello World!"
    it "Can be inscribed" do
      assert_equal words, door.inscribe(words)
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
      assert_raises(Exception) {door.open}
    end

    it "Must be closed and unlocked to be opened" do
      assert_equal true, closed_unlocked.open
    end
  end

end
