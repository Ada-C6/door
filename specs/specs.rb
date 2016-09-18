require_relative 'spec_helper.rb'
require_relative '../door.rb'


describe "Testing door" do
  
  it "Test that the instantiation of door takes exactly three parameters" do
    # parameters in order inscribe, open, locked
    quotidian_door = Door.new("Pull", true, false)
    expect(method:quotidian_door.airty).must_equal(3.abs) 
  end

  it "Tests that the parameter inscribe is a a string " do
     quotidian_door = Door.new("Pull", true, false)
     expect.quotidian_door.open.class.must_be_kind_of(bool)
  end

  it "Tests that the parameter open is a bool " do
     quotidian_door = Door.new("Pull", true, false)
     expect.quotidian_door.open.class.must_be_kind_of(class)
  end

  it "Tests that the parameter lock is a bool " do
     quotidian_door = Door.new("Pull", true, false)
     expect.quotidian_door.open.class == true || false
  end

  it "Test that the parameter inscribe is a constant" do
    quotidian_door = Door.new("Pull", true, false)
    expect.quotidian_door.inscribe.class == Constant

  end

  it "Tests that .door_locked? returns bool " do
    
  end

  

  it "Tests that " do
   
  end

  it "T" do
    

  end

  it "Tests " do

  end


  
end