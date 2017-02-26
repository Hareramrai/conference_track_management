require 'spec_helper'

describe Event do
  before :each do 
    @event = Event.new "Test Event for rspec", 10
  end
  
  it "takes two parameters and returns a Event object" do
    expect(@event).to be_an_instance_of Event
  end
  
  it "would not be schedule by default" do
    expect(@event).not_to be_schedule
  end
  
  it "would be schedule after done!" do
    @event.done!
    expect(@event).to be_schedule
  end
  
end