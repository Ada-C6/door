require_relative 'spec_helper'
module Dungeon

  describe Lock do

    describe "#initialize" do
      let(:lock) { Lock.new("ABC123") }

      it "can create an object of Lock" do
        lock.must_be_instance_of(Lock)
      end

      it"responds to information about the lock object" do
        lock.must_respond_to(:id)
        lock.must_respond_to(:lock_type)
        lock.must_respond_to(:is_locked)
      end

      it "should be unlocked on initialization" do
        lock.is_locked.must_equal(false)
      end

    end

    # for this lock it is using the lock-specific turn_key method which is implicitly tested
    describe "#locking" do
      before(:each) do
        @unlocked_lock = Lock.new("ABC123")
        @another_lock = Lock.new("ABC123")
      end

      it "should be possible to lock in the lock" do
        @unlocked_lock.locking("ABC123")
        @unlocked_lock.is_locked.must_equal(true)
      end

      it "must fail to lock unless key identifier match input key" do
        proc{@another_lock.locking("BADKEY")}.must_raise(ArgumentError)
      end

    end #method

    describe "#unlocking" do
      before(:each) do
        @unlocked_lock = Lock.new("ABC123")
        @another_lock = Lock.new("ABC123")
      end

      it "should be possible to unlock in the lock" do
        @unlocked_lock.locking("ABC123")
        @unlocked_lock.unlocking("ABC123")
        @unlocked_lock.is_locked.must_equal(false)
      end

      it "must fail to unlock unless key identifier match input key" do
        proc{@another_lock.unlocking("BADKEY")}.must_raise(ArgumentError)
      end

    end #method

    describe "#locked?" do
      before(:each) do
        @unlocked_lock = Lock.new("ABC123")
        @another_lock = Lock.new("ABC123")
      end

      it "should return false if the lock is unlocked" do
        @unlocked_lock.locked?.must_equal(false)
        @another_lock.locking("ABC123")
        @another_lock.unlocking("ABC123")
        @unlocked_lock.locked?.must_equal(false)
      end

      it "should return true if the lock is locked" do
        @another_lock.locking("ABC123")
        @another_lock.locked?.must_equal(true)
      end
    end




  end
end
