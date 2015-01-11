class EventsController < ApplicationController
  before_action :set_kind, only: [:update]
  # Controller's update action
  #
  # @param id [Kind]
  # @param event [String]
  # @example
  #   PUT /versions/id[?event=perform]
  def update
    event = params[:event]
    if event.present? and @kind.thing.transitions.map(&:on_event).include?(event) and @kind.machine.methods.include?(event.to_sym) and @kind.machine.send(event.to_sym)
      flash[:notice] = dt("notices.transition", :model => @kind.name, :event => event)
    end
    redirect_to :back, :notice => dt("notices.transition", :model => @kind.name, :event => event)
  end

private

  def set_kind
    @kind = Kind.find(params[:id])
  end

  def event_params
    params.require(:kind).permit(:event)
  end

end
