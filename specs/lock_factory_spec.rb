require_relative 'spec_helper'
module Dungeon

  describe LockFactory do
    describe "#initialize" do
      let(:lock_factory) {LockFactory.new("ABC123")}

      it "should set up a factory for instanziating new lock objects" do
        lock_factory.must_be_instance_of(LockFactory)
      end

      it "should respond to the type of lock" do
        lock_factory.must_respond_to(:lock_id)
      end

      it "should assert that the lock_id is of type String" do
        lock_factory.lock_id.must_be_instance_of(String)
      end
    end

    describe "#create" do
      let(:lock_factory) {LockFactory.new("ABC123")}

      it "should return a new lock object of class Lock" do
        lock_factory.create.must_be_instance_of(Lock)
      end

    end

  end #class
end
