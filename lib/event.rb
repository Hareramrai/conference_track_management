class Event
  
  attr_reader :title, :length
  
  def initialize title, length
    @title = title 
    @length = length
    @is_schedule = false
  end
  
  def schedule? 
    @is_schedule
  end
  
  def done!
    @is_schedule = true
  end
  
end
