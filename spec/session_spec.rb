require 'spec_helper'

describe Session do
  before :each do 
    @session = Session.new 
  end
  
  describe ".add_event!" do 
    it "will mark the event as schedule" do 
      event = Event.new 'Test Event for Maximum size', 40
      @session.add_event!(event)
      expect(event).to be_schedule
    end
    
    it "will increase the events count by one for the session" do
      event = Event.new 'Test Event for Maximum size', 30
      expect { @session.add_event!(event) }.to change{@session.events.count}.by(1)
    end
  end
  
  it ".events?" do
    event = Event.new 'Test Event for Maximum size', 20
    @session.add_event!(event) 
    expect(@session).to be_events
  end
  
end