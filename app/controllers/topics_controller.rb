class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @topics = Topic.all
    respond_with(@topics)
  end

  def show
    respond_with(@topic)
  end

  def new
    @topic = Topic.new
    respond_with(@topic)
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.author = current_user
    @topic.parent_control = ControllerPage.find_by_name('topics')
    if @topic.save
      flash[:notice] = dt("notices.create", :model => @topic.name, :link => undo_link)
    end
    respond_with(@topic, :location => topics_url)
  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = dt("notices.update", :model => @topic.name, :link => undo_link)
    end
    respond_with(@topic, :location => topics_url)
  end

  def destroy
    @topic.destroy
    flash[:notice] = dt("notices.destroy", :model => @topic.name, :link => undo_link)
    respond_with(@topic, :location => topics_url)
  end

private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :parent_control, :link, :reversion)
  end

  def undo_link
    view_context.link_to(dt("notices.undo"), version_path(@topic.versions.last.id, :reversion => 'undo'), :method => :put)
  end
end
