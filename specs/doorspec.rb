# Appropriate error messages should be displayed and no changes to the Door should be made, if any conditions of the functions are violated.
# You should write specs for this class, to achieve at least 90% test coverage (using simplecov).

require_relative 'spec_helper'
require_relative '../door.rb'

  class Door

    describe "#initialize" do

      it "1 should return instances of self" do
        burtlesbard = Door.new
        burtlesbard.must_be_instance_of(Door)
      end

      it "2 should honor default settings of self" do
        burtlesbard = Door.new
        burtlesbard.open_status?.must_equal(true)
        burtlesbard.inscription.must_equal(nil)
      end
    end

    describe "access" do

      it "3 checks if the door is closed " do
        #since the door is set ajar, this should not work
        burtlesbard = Door.new
        burtlesbard.access.must_raise(Exception)
      end

      it "4 checks if unlocked " do
        #since the door is changed from its default to be locked, this should not work
        burtlesbard = Door.new("mardigalmcgilicuddy", true, false)
        burtlesbard.access.must_raise(Exception)
      end

      it "5 only allows a closed door to be opened " do
        burtlesbard = Door.new
        burtlesbard.access.must_raise(Exception)
      end
    end

    describe "close" do
      it "6 should only close an open door" do
      burtlesbard = Door.new
      burtlesbard.close
      burtlesbard.open_status?.must_equal(false)
      end

      it "7 should catch exceptions" do
        burtlesbard = Door.new("unicornelious", false, true)
        proc {burtlesbard.close}.must_raise(Exception)
      end
    end

    describe "inscribe" do
      it "8 should allow inscription of a blank door" do
        burtlesbard = Door.new("unicornelious")
        burtlesbard.inscription.must_equal("unicornelious")
      end

      it "9 should not allow for re-inscriptions of the same door" do
        burtlesbard = Door.new("unicornelious")
        proc {burtlesbard.inscribe}.must_raise(Exception)
      end
    end

    describe "lock" do
      it "10 should lock an unlocked door" do
        burtlesbard = Door.new
        burtlesbard.lock
        burtlesbard.lock_status?.must_equal(false)
      end

      it "11 should not 'lock' a locked door" do
        burtlesbard = Door.new("unicornelious", true, false)
        proc {burtlesbard.lock}.must_raise(Exception)
      end
    end

    describe "unlock" do
      it "12 it should unlock a locked door" do
        burtlesbard = Door.new
        proc {burtlesbard.unlock}.must_raise(Exception)
      end

      it "13 it should unlock a locked door" do
        burtlesbard = Door.new("tettra", false, false)
        burtlesbard.unlock
        burtlesbard.lock_status?.must_equal(true)
      end
    end

    describe "name" do
      it "returns @inscription" do
        burtlesbard = Door.new("Tessla", false, false)
        burtlesbard.inscription.must_equal("Tessla")
      end
    end

    describe "lock_status?" do
      it "returns @unlocked" do
        burtlesbard = Door.new
        burtlesbard.lock_status?.must_equal(true)
      end
    end

    describe "open_status?" do
      it "returns @ajar" do
        burtlesbard = Door.new
        burtlesbard.open_status?.must_equal(true)
      end
    end
  end
