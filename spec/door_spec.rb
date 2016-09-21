require_relative 'spec_helper'
require_relative '../lib/door'

describe 'Test of Door class' do

  it 'new instance of door must contain defaults when no parameters are passed in' do
    expect(bob.open).must_equal(true)
    expect(bob.unlocked).must_equal(true)
    expect(bob.inscription).must_equal(nil)
  end

end#end of test
