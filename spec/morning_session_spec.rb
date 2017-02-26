require 'spec_helper'

describe MorningSession do
  before :each do 
    @morning_session = MorningSession.new 
  end
  
  it "has a maximum capacity of 180 minutes" do
    expect(@morning_session.length).to eq(180)
  end
  
  describe ".can_accomodate?" do 
    it "any event less than 180 minutes" do 
      event = Event.new 'Test Event for Maximum size', 180
      expect(@morning_session.can_accomodate?(event)).to be_truthy
    end
    
    it "to fail any event greater than 180 minutes" do 
      event = Event.new 'Test Event for Maximum size', 200
      expect(@morning_session.can_accomodate?(event)).to be_falsey
    end
  end
  
end