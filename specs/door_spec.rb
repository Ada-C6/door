require_relative './spec_helper'

describe Door do
  # door instance that is opened and locked
  # with default inscription
  let(:door) { Door.new(true, true) }


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


end
