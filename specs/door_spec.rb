require_relative './spec_helper'

describe Door do

  it "Exists" do
    Door.wont_be_nil
  end

  describe "Door#inscription" do
    it "Can have an inscription" do
      refute_nil(Door.new.inscription)
    end
  end
end
