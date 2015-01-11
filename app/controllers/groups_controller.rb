class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @groups = Group.where("name != ?", '*')
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.author = current_user
    @group.parent_control = ControllerPage.find_by_name('groups')
    if @group.save
      flash[:notice] = dt("notices.create", :model => @group.name, :link => undo_link)
    end
    respond_with(@group, :location => groups_url)
  end

  def update
    if @group.update(group_params)
      flash[:notice] = dt("notices.update", :model => @group.name, :link => undo_link)
    end
    respond_with(@group, :location => groups_url)
  end

  def destroy
    @group.destroy
    flash[:notice] = dt("notices.destroy", :model => @group.name, :link => undo_link)
    respond_with(@group, :location => groups_url)
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :user_ids => [])
    end

    def undo_link
      view_context.link_to(dt("notices.undo"), version_path(@group.versions.last, :reversion => 'undo'), :method => :put)
    end
end
