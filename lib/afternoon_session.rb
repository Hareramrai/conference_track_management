require_relative 'session'
class AfternoonSession < Session
  
  def initialize 
    super
    @length = 240
  end
  
  def can_accomodate? event
    (available_minutes - event.length) > 0 
  end
  
  private
  
  def start_time 
    1
  end
  
  def period
    "PM"
  end

end