require_relative 'session'
class AfternoonSession < Session
  
  def initialize 
    super
    @length = 240
  end
  
  def can_accomodate? event
    (available_minutes - event.length) > 0 
  end
  
  def log_events
    super 
    log_networking_event
  end
  
  private
  def log_networking_event
    puts "#{event_start_time Event.new('',0) }#{period} Networking Event"
  end
  
  def start_time 
    1
  end
  
  def period
    "PM"
  end

end