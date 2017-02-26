require 'spec_helper'

describe AfternoonSession do
  before :each do 
    @afternoon_session = AfternoonSession.new 
  end
  
  it "has a maximum capacity of 240 minutes" do
    expect(@afternoon_session.length).to eq(240)
  end
  
  describe ".can_accomodate?" do 
    it "any event less than 240 minutes" do 
      event = Event.new 'Test Event for Maximum size', 239
      expect(@afternoon_session.can_accomodate?(event)).to be_truthy
    end
    
    it "to fail any event greater than 240 minutes" do 
      event = Event.new 'Test Event for Maximum size', 250
      expect(@afternoon_session.can_accomodate?(event)).to be_falsey
    end
  end
  
end