class Admin::EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = events.new
    render plain: render_to_string(partial: '_form_new', layout: false,locals: {event: @event})
  end

  def create
    @event = events.new(params_event)
    if @event.save
      # リクエストによって処理を分けるためrespond_toを使用
      respond_to do |format|
        format.html { redirect_to 'admin_events_path' }
        # create.js.erbを探す
        format.js
      end
    else
      respond_to do |format|
        # 登録エラーの場合はerror.js.erbを探す
        format.js {render partial: "error"}
      end
    end
  end

  def params_event
    params.require(:event).permit(:title,:start)
  end
end
