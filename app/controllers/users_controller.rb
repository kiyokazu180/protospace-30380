class UsersController < ApplicationController
  def show
    @prototype = Prototype.find(params[:id])
    @user = User.find(@prototype.user_id)
    @prototypes = @user.prototypes
  end  
end
