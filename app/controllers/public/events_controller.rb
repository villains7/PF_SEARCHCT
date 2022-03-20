class  Public::EventsController < ApplicationController
  def index
    date = DateTime.now
    event_date = date.at_beginning_of_month + 19
    if event_date.wday == [1..5]
      
    
  end
end
