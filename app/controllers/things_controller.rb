class ThingsController < ApplicationController
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @things = Thing.where("name != ?", '*')
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
    @thing.author = current_user
    @thing.parent_control = ControllerPage.find_by_name('things')
    if @thing.save
      flash[:notice] = dt("notices.create", :model => @thing.name, :link => undo_link)
    end
    respond_with(@thing, :location => things_url)
  end

  def update
    if @thing.update(thing_params)
      flash[:notice] = dt("notices.update", :model => @thing.name, :link => undo_link)
    end
    respond_with(@thing, :location => things_url)
  end

  def destroy
    @thing.destroy
    flash[:notice] = dt("notices.destroy", :model => @thing.name, :link => undo_link)
    respond_with(@thing, :location => things_url)
  end

  private
    def set_thing
      @thing = Thing.find(params[:id])
    end

    def thing_params
      params.require(:thing).permit(:name, :parent_control, :link, :reversion, :name, :color, :position, :x, :y)
    end

    def undo_link
      view_context.link_to(dt("notices.undo"), version_path(@thing.versions.last.id, :reversion => 'undo'), :method => :put)
    end

end
