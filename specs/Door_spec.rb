#Door_spec.rb

require_relative 'Spec_helper'
require_relative '../lib/Door'


describe 'Testing Door' do
  let(:new_door) { Door.new("Secret Garden") }


#############--------------Door Tests--------------------###########

  it "Must be a door" do
    expect(new_door).must_be_instance_of(Door)
  end

end
