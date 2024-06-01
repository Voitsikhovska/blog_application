class UsersController < ApplicationController
  before_action :set_user
  def profile
     # calls the set_user method before each controller action
    @user.update(views: @user.views + 1)

  end
  private

  def set_user
    # finds the user by the id parameter and sets the @user variable
    @user = User.find(params[:id])
  end
end
