class Session
  
  def initialize 
    @last_event_time = 0
    @events = []
  end
  
  def can_accomodate? event
    (available_minutes - event.length) >= 0 
  end
  
  def available_minutes
    @length - @events.inject(0) { |sum, event| sum + event.length }
  end
  
  def add_event! event
    event.done!
    @events << event
  end
  
  def log_events 
    @events.each do |event|
      puts "#{event_start_time event}#{period} #{event.title}"
    end
  end
  
  def events?
    !@events.empty?
  end
  
  private
  
  def start_time 
    9
  end
  
  def period
    "AM"
  end
  
  def event_start_time event
    str_time = calculate_time
    @last_event_time += event.length
    str_time
  end
  
  def calculate_time 
    hours, minutes = @last_event_time.divmod(60)    
    "#{format(hours+start_time)}:#{format(minutes)}"
  end
  
  def format time 
    if time > 9
      time
    else
      "0" + time.to_s
    end
  end
end