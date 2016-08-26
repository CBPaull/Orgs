class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.errors.any?
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    else
      session[:user_id] = @user.id
      redirect_to organizations_path
    end
  end
  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end
end
