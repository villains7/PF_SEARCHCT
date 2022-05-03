class Admin::EventsController < ApplicationController
  def new
    @event = events.new
    render plain: render_to_string(partial: 'form_new', layout: false,locals: {event: @event})
  end
end
