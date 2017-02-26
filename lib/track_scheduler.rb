require_relative 'event_reader'
require_relative 'track'
class TrackScheduler
  include EventReader
  
  def initialize filename="./data/input.txt"
    @events = read_all_events filename
    @tracks = []
  end
  
  def perform
    until pending_events.empty? do
      pending_events.each do |event|
        if check_availability? event
          schedule_event! event
        end
      end
      prepare_next_track
    end
  end
  
  def schedule_event! event
    current_track.add_event! event
  end
  
  def print_all_tracks
    filter_tracks.each_with_index do |track, index|
      puts "Track #{index+1}:"
      track.print
      puts " "
    end
  end
  
  private 
  
  def filter_tracks
    @tracks.select(&:events?)
  end
  
  def pending_events 
    @events.reject(&:schedule?)
  end
  
  def check_availability? event
    current_track.can_accomodate? event
  end
  
  def current_track 
    @tracks.last || (@tracks << Track.new ).last 
  end
  
  def prepare_next_track 
    add_networking_event
    @tracks << Track.new
  end
  
  def add_networking_event
    current_track.add_event! Event.new('Networking Event',0), false
  end
end