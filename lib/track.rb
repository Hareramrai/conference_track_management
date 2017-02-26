require_relative 'morning_session'
require_relative 'afternoon_session'
require 'forwardable'
class Track
  extend Forwardable
  
  def_delegator :@morning_session, :length, :morning_session_length
  def_delegator :@afternoon_session, :length, :afternoon_session_length
  
  def initialize
    @morning_session = MorningSession.new 
    @afternoon_session = AfternoonSession.new 
  end
  
  def can_accomodate? event
    @morning_session.can_accomodate?(event) || @afternoon_session.can_accomodate?(event)
  end
  
  def add_event! event, morning_session=true
    if @morning_session.can_accomodate?(event) && morning_session
      @morning_session.add_event! event 
    else
      @afternoon_session.add_event! event 
    end   
  end
  
  def print
    @morning_session.log_events
    puts "12:00PM Lunch"
    @afternoon_session.log_events
  end
  
  def events?
    @morning_session.events? and @afternoon_session.events?
  end
  
  def length 
    morning_session_length + afternoon_session_length
  end
  
end