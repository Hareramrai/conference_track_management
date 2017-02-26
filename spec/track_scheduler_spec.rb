require 'spec_helper'

describe TrackScheduler do
  before :each do 
    @track_scheduler = TrackScheduler.new 
  end
  
  it "schedule all the event and print the results" do
    @track_scheduler.perform 
    final_result = File.read File.expand_path( "fixtures/results.txt", File.dirname(__FILE__) ) 
    expect { @track_scheduler.print_all_tracks }.to output(final_result).to_stdout 
  end
  
end