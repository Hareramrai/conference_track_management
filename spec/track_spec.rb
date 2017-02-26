require 'spec_helper'

describe Track do
  before :each do 
    @track = Track.new 
  end
  
  it "has a maximum capacity of 420 minutes" do
    expect(@track.length).to eq(420)
  end
  
  describe ".can_accomodate?" do 
    it "any event less than 180 minutes" do 
      event = Event.new 'Test Event for Maximum size', 150
      expect(@track.can_accomodate?(event)).to be_truthy
    end
    
    it "any event greater than 180 and less than 240 minutes" do 
      event = Event.new 'Test Event for Maximum size', 200
      expect(@track.can_accomodate?(event)).to be_truthy
    end
  end
  
  describe ".events?" do 
    it "would be empty without any afternoon session event" do 
      event = Event.new 'Test Event for Maximum size', 150
      @track.add_event!(event)
      expect(@track.events?).to be_falsey
    end
    
    it "would be empty without any morning session event" do 
      event = Event.new 'Test Event for Maximum size', 210
      @track.add_event!(event)
      expect(@track.events?).to be_falsey
    end
  end
  
end