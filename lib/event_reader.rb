require_relative 'event'
module EventReader 

  LIGHTNING_EVENT_LENGHT = 5 
   
  def read_all_events file_name
    events = []
    File.open(file_name, 'r').each_line do |line|
      events << parse_event(line)
    end
    events
  end
  
  def parse_event line
    event_arr = line.match(/(\w+.*?)(\d+|lightning$)/)
    length = event_arr[2].eql?("lightning") ? LIGHTNING_EVENT_LENGHT : event_arr[2].to_i
    Event.new line.strip, length
  end
end