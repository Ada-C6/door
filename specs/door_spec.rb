require_relative './spec_helper'

describe Door do
  let(:door) { Door.new(true) }

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


end
