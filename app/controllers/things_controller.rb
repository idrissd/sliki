class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @things = Thing.all
    respond_with(@things)
  end

  def show
    respond_with(@thing)
  end

  def new
    @thing = Thing.new
    respond_with(@thing)
  end

  def edit
  end

  def create
    @thing = Thing.new(thing_params)
    @thing.save
    respond_with(@thing)
  end

  def update
    @thing.update(thing_params)
    respond_with(@thing)
  end

  def destroy
    @thing.destroy
    respond_with(@thing)
  end

  private
    def set_thing
      @thing = Thing.find(params[:id])
    end

    def thing_params
      params.require(:thing).permit(:topic_id, :name, :color, :position, :x, :y)
    end
end
