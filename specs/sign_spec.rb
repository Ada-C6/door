require_relative 'spec_helper'
module Dungeon
  describe Sign do

    describe "#initialize" do
      let(:sign) { Sign.new("words") }
      let(:empty_sign) { Sign.new }
      let(:symbol_sign) { Sign.new(:words) }
      let(:number_sign) { Sign.new(1234) }
      let(:pi_sign) { Sign.new(3.14) }

      it "can create an object of Sign" do
        sign.must_be_instance_of(Sign)
      end

      it "should respond to sign parameter" do
        sign.must_respond_to(:inscription)
      end

      it "should allow only String or NilClass for its inscription parameter" do
        proc{symbol_sign}.must_raise(ArgumentError)
        proc{number_sign}.must_raise(ArgumentError)
        proc{pi_sign}.must_raise(ArgumentError)
      end

    end #init

    describe "#inscribe" do
      before(:each) do
        @empty_sign = Sign.new
        @inscripted_sign = Sign.new("words")
      end

      it "should set a value to inscription" do
        sign = @empty_sign
        sign.inscribe("Warning! Danger!")
        sign.inscription.must_equal("Warning! Danger!")
      end

      it "should not be possible to change the inscription once set" do
        sign = @empty_sign
        sign.inscribe("Warning! Danger!")
        sign.inscribe("Free candy this way")
        sign.inscription.must_equal("Warning! Danger!")
      end

      it "should be inscribed with a String type of at least one character" do
        sign = @empty_sign
        sign.inscribe(:words)
        sign.inscribe(1234)
        sign.inscribe(3.14)
        sign.inscribe("")
        sign.inscription.must_equal(nil)
      end
    end

  end
end
