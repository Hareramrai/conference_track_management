require_relative 'session'
class MorningSession < Session
  
  def initialize 
    super
    @length = 180
  end
  
end