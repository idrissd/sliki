class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
  respond_to :html, :json

  # after_action :verify_authorized

  def index
    @users = User.all
    # authorize User
    respond_with(@users)
  end

  def show
    # authorize @user
    respond_with(@user)
  end

  def update
    # authorize @user
    if @user.update(user_params)
      flash[:notice] = dt("notices.update", :model => @user.name, :link => undo_link)
    end
    respond_with(@user, :location => users_url)
  end

  def destroy
    # authorize @user
    @user.destroy
    flash[:notice] = dt("notices.destroy", :model => @user.name, :link => undo_link)
    respond_with(@user, :location => users_url)
  end

  private

  def set_user
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
  
  def user_params
    params.require(:user).permit(:role, :name, :email)
  end

  def undo_link
    view_context.link_to(dt("notices.undo"), version_path(@user.versions.last.id, :reversion => 'undo'), :method => :put)
  end

end
