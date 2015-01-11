class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]
  # after_action :verify_authorized

  def index
    @users = User.all
    # authorize User
  end

  def show
    # authorize @user
  end

  def update
    # authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    # authorize @user
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def set_user
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end
  
  def secure_params
    params.require(:user).permit(:role)
  end

end
