class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @topic = model
  end

  def index?
    @current_user == @user
  end

  def show?
    @current_user == @user
  end

  def update?
    @current_user == @user
  end

  def destroy?
    @current_user == @user
  end

end
